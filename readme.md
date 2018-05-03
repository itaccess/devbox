# IT Acccess devbox

A development environment in a box including vim/tmux/git and friends...

## Purpose

1. test the viability of working inside a docker container as a primary development environment.
2. make a lightweight docker container with essential tools that can be loaded onto remote servers for a more pleasant development experience.

## Quickstart

$ alias devbox="$(docker run itaccess/devbox)"
$ cd some_project_folder
$ devbox
$ echo 'amazing, I have docker, vim and tmux all configured just the way I like it - inside a container!'

## Lite version

$ alias devbox-lite="$(docker run itaccess/devbox:lite)"
$ devbox-lite

There are two docker images, the lite one, and the main one which is built as a layer on top of it. The lite version includes:

- git
- zsh (and oh-my-zsh)
- tmux
- vim (and some nice plugins)

## Main version

Has everything lite version has plus...

- docker (even though I am in a docker - because docker is like sunshine and the internet, you can never have enough)
- python3
- build tools
- network tools

## Ambition of the project

Try to make a general purpose development environment with a strong focus on awesomeness that is palatable to developers. Try to build a small group of developers to learn together the joy of vim/tmux/docker/nodejs and the shell in general.
