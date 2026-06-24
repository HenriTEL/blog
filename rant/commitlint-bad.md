# Commitlint: sounds good, doesn't work

> Conventinal Commits aka commitlint is just pain and suffering.

The idea of Conventional Commits is to force people using a specific format in their commit messages so that humans can quickly parse the scope and the kind of changes.  
Once this format is in place we can easily automate some very nice things like automatic changelogs and version number.  

But in practice it's just pain and suffering because:

* It provides endless ways to piss off your developers with a strict format that YOU repo owner are free to standardize.
Usually commits must start with `TYPE(SCOPE): ` followed by the summary. But then you can force that summary to start with a lowercase or an uppercase and to make sure that it ends with a dot, or never ends with one, or whatever.
* It does not work well with GitHub and other cloud SCM, because the only way to make it less unbearable to devs is to check the commit message BEFORE it's saved on the server. It's called a `pre-receive hook` and can only be set on on-premise SCM servers, AFAIK. You can configure a local pre-push hook to bypass this limitation but then it becomes an additional thing that each contributor has to manage.
Otherwise, well, have fun amending and force-push your commits.
* It does not work well with git, or any tool that prepare commits for you (the code editor from your SCM website, Github desktop, etc.)
because, well, when for example you run `git merge` a nice commit message will be made for you but the git cli could not care less about Conventinal Commits™.
* It conflicts with some workflows. For example squash + merge where the message of the squashed commit is the title of a merge request.

I could continue but you get the main point. It's a rigid format that gets in the way of new contributors and restricts them to a specific workflow that may not like.  
There's one thing I used to like about it: the ability to automatically detect breaking changes and adapt the version number accordingly. But even that can backfire, for example it cannot revert breaking changes, versionning only goes forward.
If you want to beat a dead horse I suggest this follow-up: [stop-using-conventional-commits](https://sumnerevans.com/posts/software-engineering/stop-using-conventional-commits/)  

PS: You know what's even worst that Convential Commit? The same thing but for branch names. x_x
