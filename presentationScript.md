# Intro to Git for Scientists
Runtime roughly 1 hour. Familiarity with unix command line assumed.

## why do we care?
First: ask people why they care, or what they're here to learn

Want backups and version control

some people want containers
What are Singularity containers?

Some want git annex and datalad, also using bids app on the cluster.

### My goals:
There is so much documentation on git online, it can be overwhelming.  
I just want to set everyone up with a basic workflow, and you can build from there.

If you learn these habits, it will:
- Make it easier to replicate and share your science.
- Make it easier for you to manage operations in the long run.

Concrete examples of things git can help with:
- accidentally delete a file
- you want to try out a different analysis style and then change your mind
- you share code with someone else, then discover a bug

Healthy communication practices are built-in.

#### You never know what something could become

> I’m doing a (free) operating system (just a hobby, won’t be big and
> professional like gnu)

~ Linus Torvalds, creator of Linux, which runs 80% of all smartphones and 50% of all web servers worldwide.

#### references for independent learning
A good reference is the [pro git book](https://git-scm.com/book/en/v2).
A helpful collection of [tips and tricks for beginners](http://ohshitgit.com).
Also check out [this site](https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/) for a more in-depth explanation of some things we should all do to organize our digital workspaces. I used these guidelines in designing the directory structure we set up.

## How to do it:

### Downloading git

You should be able to just run `git` if you have a mac.

On linux you should be able to use your regular package manager.

On the cluster, you can run `module load git`.

If you get stuck, consult this [installation guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Setting up your repo

Before we get started -- what sort of technologies are people using?

R? Matlab? Mfiles are a good example of the sort of thing we would put in the `exec/` directory.

If you're coding in C++ or some other compiled language, consider using `bin/` and `src/` instead.

```
mkdir sampleproject
cd sampleproject
mkdir exec results data doc
```

```
git init .
vim README.md
```
in vim, hit the "i" key to enter insert mode, then type normally.  Hit escape to return to command mode.

type `:wq` to write the buffer to file and quit the program.

Make a small example file in `exec/`, you can call it `hello_world.sh`

You may have to use `chmod u+x hello_world.sh` to give yourself execute permissions.

Adding files tells git to keep track of them. Git tracks the files you tell it to track, and ignores the files you tell it to ignore.

```
git add exec/hello_world.sh
git status
git add README.md
vim .gitignore
```
Some things not to track: PDFs, .docx, data, results.
You can, for example, create markdown or latex files and convert them to PDFs locally instead of using word documents. This will work better with git version control, because those documents are plaintext.
Let's commit -- think of it like a save point in a video game or a draft of a paper.

```
git status
git commit -m "initial commit"
```
Now, let's make a change.
For example, we can change `hello_world.sh` e.g. by adding a line with the `date` command.
Let's make sure our script works, first.
Commit again with message "added date"

```
git log
git checkout 32c7273
git branch
git checkout master
```
#### file operations

If you need `rm` or  `mv` a file, use  `git rm` or `git mv` to also remove or change the git tracking for these files.

### ncfcode.rc.fas.harvard.edu
sign in with your usual harvardKey username and password

create a new project

#### SSH Key
We probably want to set up an ssh key(though https can work well in many situations as well).

top right > profile icon > settings > SSH Keys

Follow the link, use the instructions to generate a key and upload it to gitlab.
You need a new key for every computer you want to use to connect to gitlab via ssh.
Alternatively, you can use https authentication and type in your username and password each time you access a remote repository.

#### sync our repo
Go back to the page for the repo you just created.
Follow the steps for the "existing Git repository".
check out the settings, ask for questions

## advanced topics

### collaboration using github features

#### Forking
Check out the "Fork" button on the top of the screen. This allows you to create a copy of someone else's repository and have total control over subsequent changes. You cannot fork a repository that has the same name as one of your repositories.

#### Merge requests in GitLab

(Also called "Pull requests" in gitHub)

If you fork someone's repository and make some improvements you'd like to tell the author about, send them a merge request.  They can review your proposed changes and either reject them or decide to merge them into their project.

Merge requests are a great way of institutionalizing the practice of code review.
You can set up gitlab such that people can clone your repository and create their own branches, but merging those branches onto master requires a request. 
This sort of workflow can be especially helpful if you have undergrad assistants. 
It allows them to learn and experiment, and allows you to make sure they can't do anything that breaks your code or changes it without you knowing.

You can only submit Merge Requests to projects you have forked, not projects that have forked off of yours.

#### Groups
These can be useful if you want multiple people, or a changing roster of people, to have control over a project or group of projects.

### branches
Branches are useful if you want to try out different things.
For example, you can develop a new feature or try to rebase your code without any danger of affecting your existing setup.

```
git checkout -b uname_description
git branch
```
Branches are CRUCIAL if you're shipping code for others to use.  That way, you can experiment, make modifications, and break things without worrying about breaking things for other people who are using your code.

If you decide you want to merge branches back into master:

1. Commit everything to your branch.
2. Switch back to master branch with `git checkout master`
3. Merge with `git merge yourBranchName` and handle any errors that arise

You can also use branching and merge requests to manage collaboration.

## What did we learn?
Fork [this repo](https://ncfcode.rc.fas.harvard.edu/hhoke/sampleProject_share) and write your own notes here :)
