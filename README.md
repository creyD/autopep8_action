# GitHub autopep8 Action

[![License MIT](https://img.shields.io/github/license/creyD/autopep8_action)](https://github.com/creyD/autopep8_action/blob/master/LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/creyD/autopep8_action)](https://github.com/creyD/autopep8_action/releases)
[![Contributors](https://img.shields.io/github/contributors-anon/creyD/autopep8_action)](https://github.com/creyD/autopep8_action/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/creyD/autopep8_action)](https://github.com/creyD/autopep8_action/issues)

This action automatically restyles Python code according to [PEP-8](https://www.python.org/dev/peps/pep-0008/) using  [autopep8](https://github.com/hhatto/autopep8).

## Usage
### Parameters

The following parameters can be used in your custom action configuration.

| Parameter | Required | Default | Description |
| - | - | - | - |
| commit_message | :x: | 'Adjusted files for PEP-8 compliance' | Custom git commit message |
| commit_options | :x: | - | Custom git commit options |
| file_pattern | :x: | '&ast;' | Custom file pattern for `git add` |
| checkpath | :x: | '.' | The path autopep8 checks |
| no_commit | :x: | False | Avoid committing, if used in a pipeline |
| options | :x: | ' ' | Parameters to use with autopep8 |
| dry | :x: | false | Dry-run the action to fail when detecting PEP-8 uncompliant files, instead of automatically fixing them. |
| github_token | :x: | `${{ github.token }}` | The default [GITHUB_TOKEN](https://docs.github.com/en/actions/reference/authentication-in-a-workflow#about-the-github_token-secret) or a [Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)

### Example

This is a simple usage example of this script:

```yaml
# This action works with pull requests and pushes
name: Continuous Integration

on:
  pull_request:
  push:
    branches:
    - master

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
      with:
        # Make sure the actual branch is checked out when running on pull requests
        ref: ${{ github.head_ref }}
    - uses: creyD/action_autopep8@v3.1
```

## Issues

Please report all bugs and feature request using the [GitHub issues function](https://github.com/creyD/autopep8_action/issues/new).

## Special Thanks

- Hideo Hattori [(GitHub)](https://github.com/hhatto) for creating and maintaining autopep8
- Stefan Zweifel [(GitHub)](https://github.com/stefanzweifel) for providing an action to commit and push a git change


If you want you may also use my [autoflake](https://github.com/creyD/autoflake_action) and [prettier](https://github.com/creyD/prettier_action) GitHub actions.
