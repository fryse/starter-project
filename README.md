# Fryse Starter Project

Used to start a new Fryse project or just to play around.

## Getting Started

```
git clone git@github.com:fryse/starter-project.git
cd starter-project
fryse build
fryse serve
```

## Building and Publishing on GitHub Pages

If you are using Fryse 0.3.1 or later, you can create a build for GitHub Pages.

This assumes you want to publish a project page using the `gh-pages` branch.

### Configuration

Take a look at [config-gh-pages.yml](config-gh-pages.yml) 
and change the `path_prefix` setting to match your repository name.

### Branch Preparation

First, we need to setup the `gh-pages` branch. 
Before you start, make sure to commit any changes to the current branch.

Run the following commands to setup the branch:

```
git checkout --orphan gh-pages
git reset --hard
git commit --allow-empty -m "Creating gh-pages branch"
git push origin gh-pages
git checkout master
```

Now we need to check out the `gh-pages` branch into our `_site` directory using git's worktree feature.
Essentially, the worktree allows you to have multiple branches 
of the same local repository to be checked out in different directories:

```
rm -rf _site
git worktree add -B gh-pages _site origin/gh-pages
```

### Building and Pushing

Now that we have set up our branch, we can generate and publish our page.

```
fryse build -o config-gh-pages.yml
cd _site && git add --all && git commit -m "publishing to gh-pages" && cd ..
git push origin gh-pages
```

Repeat these 3 commands every time you want to publish new changes.
