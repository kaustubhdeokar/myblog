---
layout: post
title: Git Primer.
image: /assets/img/merge_rebase.jpeg
categories: programming
---

Git is a distributed revision control system.

Peeling out the distributed layer -> revision control system.

control system -> content tracker.
    at it's core -> persistent map.


every file has a hash
> git hash-object <file-name>    

To see contents of a file committed for a commit.

> git cat-file -p <file-hash-id>

```
git cat-file -p d3e2cf226d9bc3c33ededec1aedf03723945d602

    All these files had these states during commit.

    040000 tree 6e6c53c7c92049cf68858d6efcc37f7698c4d455	database
    040000 tree 75100c61e0410021cbd38768bd63cbb9dc853e84	geolocation
    040000 tree 77d3d0eecb38b13a448555d00f440fef8e004375	logtime .....


    Expanding on this , if the same command is carried on just a file (not a folder) it will show the exact contents present during that commit.

git cat-file -p b37e5d65cecb6ce2dcda99f691404463bd28447a

```

### Git branches

git puts the branches in the folder .git/refs/heads
branch is just a reference to a commit. Doesn't mean anything else.

> git checkout <branch> 
    >> this points the HEAD to a commit and sends it in a detached HEAD state.


> git rebase & git merge - the end goal is the same. rebase copies commits onto the main branch.
    
![]({{page.image | relative_url}})

Complete git guide:
    [Dev.to link](https://dev.to/opensauced/the-power-of-git-a-guide-to-collaborative-version-control-dl6)

