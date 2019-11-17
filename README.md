# GitHub autopep8 Action

This action uses the newly released GitHub action to automatically restyle your Python code according to [PEP-8](https://www.python.org/dev/peps/pep-0008/) using  [autopep8](https://github.com/hhatto/autopep8).

## Usage
### Parameters
The following parameters can be used in your custom action configuration.

| Parameter | Required | Default | Description |
| - | - | - | - |
| commit_message | :x: | 'Adjusted files for PEP-8 compliance' | Custom git commit message|
| commit_options | :x: | - | Custom git commit options|
| file_pattern | :x: | '&ast;' | Custom file pattern for `git add`|
| dependencies | :x: | 'requirements.txt' |  Path for the repositories 'requirements.txt'. If you have none, you may skip this.|
| branch | :white_check_mark: | - | The specific branch you want to merge into. Use ${{ github.head_ref }} if you want to use this with pull requests. |
| checkpath | :x: | '.' | The path autopep8 checks |
| autoparameters | :x: | ' ' | Parameters to use with autopep8 |

### Example

This is a simple usage example of this script:

```
name: Autopep 8

on: [pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
      with:
        fetch-depth: 1
    - uses: creyD/action_autopep8@master
      with:
        dependencies: 'requirements.txt'
        branch: ${{ github.head_ref }}
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```

## Issues

Please report all bugs and feature request using the [GitHub issues function](https://github.com/creyD/action_autopep8/issues/new).

## Special Thanks

- Hideo Hattori [(GitHub)](https://github.com/hhatto) for creating and maintaining autopep8
- Stefan Zweifel [(GitHub)](https://github.com/stefanzweifel) for providing an action to commit and push a git change
