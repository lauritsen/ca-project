# Git exercises

To make each assignment, run the `setup.sh` file and examine the git repository in the `exercise` folder.

You need to provide the git commands you need to solve the task, as well as a copy of the following command from each repository:

`git log --oneline --graph --decorate --all`

## 1

The git commit history looks like a developers internal "I gotta save this" work. Not suited for public.
All work belongs to a task called "#321"

### Task

1. _Squash_ the five relevant commits into one, with the commit message of "close #321"
1. How does `git log` look now?

### Solution

#### git commands

* `git log`
* `git rebase -i`
* using reword to rename
* using fixup to squash commits

#### git log --oneline --graph --decorate --all

```bash
$ git slog
* 0061dba (HEAD -> master) close #321
* f921784 initial file
```

## 2

You develop a new feature on the branch `new-feature`. You have already
implemented the first part of a feature, when you are notified of a critical
bug that has to be fixed right away on the `master` branch.

After the bug fix, you continue to work on the new feature. After you committed the second part of the feature, you realize that you have done your commit on the `master` branch instead of the feature branch.

### Task

1. Move the faulty commit from the `master` branch to the `new-feature` branch.
1. Copy the bugfix to your feature branch as well

### Solution

#### git commands

* `git log`
* `git cherry-pick`
* `git rebase -i`

#### git log --oneline --graph --decorate --all

```bash
$ git slog
* 779a89b (HEAD -> new-feature) Fix bug
* fef9be6 Implement second part of feature
* a937cf9 Implement first part of feature
| * c86a293 (master) Fix bug
|/
* 30dba49 Initial commit
```

## 3

You have developed a new feature, and wants to commit it to master:

```bash
* 1f37b43 (HEAD -> master) Add readme
| * a824913 (uppercase) Change greeting to uppercase
|/  
* b84f28f Add content to greeting.txt
* efb74a6 Add file greeting.txt
```

Instead of just merging the commit, you like a straight line of commits like the example below

```bash
* 47558e0 (HEAD -> uppercase) Change greeting to uppercase
* 1f37b43 (master) Add readme
* b84f28f Add content to greeting.txt
* efb74a6 Add file greeting.txt
```

### Task

* Show the commands in order to achieve this position of commits.
* Why does the commit with message "Change greeting to uppercase" change sha, when the others do not?

### Solution

#### git commands

* `git checkout feature`
* `git rebase master`

#### git log --oneline --graph --decorate --all

```bash
$ git slog
* 72f20b6 (HEAD -> feature) Change greeting to uppercase
* 1265a85 (master) Add readme
* 14be899 Add content to greeting.txt
* f037c5e Add file greeting.txt
```

## 4

Look at the git graph and status of the created repository to find out the state.

### Task

* In words, describe what you are seeing in the repository. Use the git terminology when applicable.

Show the list of commands you need to do the following (in the given order).

* remove the work in progress using git.
* remove the staged change
* make master go back to the commit before the bad commit
* does git track bfile.txt? Reason your answer. 

### Solution

There are to commits to the repository on the master branch.
There are changes in afile.txt that are staged and there are changes in afile.txt that aren't staged.

* remove the work in progress using git.
  * `git checkout afile.txt`
* remove the staged change
  * `git reset --hard`
* make master go back to the commit before the bad commit
  * `git reset --hard HEAD~1` or
  * `git reset --hard <first commit sha-1>`
* does git track bfile.txt? Reason your answer. 
  * bfile.txt is ignored in `.gitignore` and is therefore not tracked by git.
