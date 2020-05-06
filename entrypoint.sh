#!/bin/sh -l
# e is for exiting the script automatically if a command fails, u is for exiting if a variable is not set
# x would be for showing the commands before they are executed
set -eu

# FUNCTIONS
# Function for setting up git env in the docker container (copied from https://github.com/stefanzweifel/git-auto-commit-action/blob/master/entrypoint.sh)
_git_setup ( ) {
    cat <<- EOF > $HOME/.netrc
      machine github.com
      login $GITHUB_ACTOR
      password $GITHUB_TOKEN
      machine api.github.com
      login $GITHUB_ACTOR
      password $GITHUB_TOKEN
EOF
    chmod 600 $HOME/.netrc

    git config --global user.email "actions@github.com"
    git config --global user.name "GitHub Action"
}

# Checks if any files are changed
_git_changed() {
    [[ -n "$(git status -s)" ]]
}

echo "Installing autopep8..."
pip install -q --upgrade pip
pip install -q autopep8

echo "Running autopep8..."
autopep8 -i -r $INPUT_CHECKPATH $INPUT_OPTIONS || echo "Problem running autopep8!"

if _git_changed;
then
  if $INPUT_DRY; then
    echo "Found non-compliant files!"
    exit 1
  else
    # Calling method to configure the git environemnt
    _git_setup
    echo "Commiting and pushing changes..."
    # Add changes to git
    git add "${INPUT_FILE_PATTERN}" || echo "Problem adding your files with pattern ${INPUT_FILE_PATTERN}"
    # Commit and push changes back
    git commit -m "$INPUT_COMMIT_MESSAGE" --author="$GITHUB_ACTOR <$GITHUB_ACTOR@users.noreply.github.com>" ${INPUT_COMMIT_OPTIONS:+"$INPUT_COMMIT_OPTIONS"}
    git push origin
    echo "Changes pushed successfully."
  fi
else
  echo "Nothing to commit. Exiting."
fi
