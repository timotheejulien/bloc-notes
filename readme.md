[![Follow @nhoizey@mamot.fr](https://img.shields.io/badge/Follow%20%40tim-%235b5bf8?style=flat&logo=mastodon&logoColor=white&link=https%3A%2F%2Fmastodon.design%2F%40timothee)](https://mastodon.design/@timothee)

# Notes

## Introduction

I want to centralise all my notes (bookmarks, quotes, notes, etc).
You can see this project (in french) at [https://bloc-notes.timotheejulien.fr](hbloc-notes.timotheejulien.fr).

## Released under MIT License

Open sourced under the [MIT license](LICENSE.md).

## Installation

### Install Jekyll
You can find the tutorial here : https://jekyllrb.com/docs/installation/

### Install the project

```bash
git clone https://github.com/timotheejulien/notes.git
cd ./fromages
```

## Development

```
jekyll serve
```

## Build

```
jekyll build
```

## Ressources

### iOS Shortcut
I created an iOS Shortcut to publish a new note from your apple devices. You can download it [here](https://www.icloud.com/shortcuts/387f25b03ab54c3b863a35dc2894e0f3)

Open the shortcut and replace some variables inside it:
* The GitHub API URL: https://api.github.com/repos/YOUR-GITHUB-USERNAME/YOUR-REPO/contents/_posts/fileName.md
* The URL request: 
   * Authorization: Bearer (YOUR-GITHUB-TOKEN)