# dotfiles
Minimal dotfiles set-up

## Dependencies
GitHub, GNU Stow

## Installation
Optional step:
- back-up and delete / rename exisitng files on your system that are used in this repo.

First, check out the dotfiles repo in the $HOME directory using git

```bash
git clone git@github.com/petruburlacu/dotfiles.git
cd dotfiles
```

Then use GNU Stow to create symlins.
```bash
stow .
```
