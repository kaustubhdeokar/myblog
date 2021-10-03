# Advanced Git
[Free Code Camp Tutorial Summary](https://www.youtube.com/watch?v=Uszj_k0DGsg)

 ## Commits
> Commit should contain only the related changes. <br>
> From a single file, we can segregate the changes that should go into a commit & the changes we want to keep for later commits.<br> 
> By using the following command git prompts the user for each chunk whether it needs to go into this set of changes or not.
```
    git add -p <file name>
```

## Merge Conflicts

> On working with a merge conflict, you want to discard your changes and set back the branch to it's original state, use the following command.
```
git merge --abort
```

## Merge vs Rebase

> Merge <br>
Merge looks out for 3 different things.<br>
i. Common Ancestor of branches A&B , ii. Last commit on branch A ,iii. Last commit on branch B
<br>
If branch A does not have any additional commits than the last common ancestor, it just does a fast-forward merge from branch B. 
![Fast forward](https://github.com/kaustubhdeokar/myblog/tree/main/res/merge-fast-forward.png?raw=true)
<br>
If the branch A & B have separate commits, than a merge of both branches is combined into a separate commit.<br>
![Combined merge](https://github.com/kaustubhdeokar/myblog/tree/main/res/merge-combined.png?raw=true)
<br> Than the result will look as follows. <br>
![Combined merge result](https://github.com/kaustubhdeokar/myblog/tree/main/res/merge-combined-result.png?raw=true)

> Rebase
Rebase works differently than merging. It REWRITES the git commit history. <br>
This works in 3 steps:
(Take an example of branch-A & branch B in state of figure 2). On firing the command from branch-A
```
git rebase branch-B
```
Step 1: Removes commit C3 from branch A.<br>
Step 2: Adds commit C2 & C4 to parent C1<br>
Step 3: Finally appends commit C3 after C4. <br>

Results looks as the changes have happened linearly.<br>
![Combined merge result](https://github.com/kaustubhdeokar/myblog/tree/main/res/rebase-result.png?raw=true)

Hence it may be very dangerous to do this in production code as someone else might have based their changes on the original C3 commit which now has been modified. 