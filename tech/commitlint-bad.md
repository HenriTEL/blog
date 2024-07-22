# Commitlint: sounds good, doesn't work

> Conventinal Commits aka commitlint is just pain and suffering.

So I joined a new company and they enforces Conventinal Commits aka commitlint on a few repos.  
The idea is to force people using a specific format in their commit messages so that it's easy to understand what was done.  
Once this format is in place we can easily automate some very nice things like the generation of changelogs between two releases.  

But in practice it's just pain and suffering because:

* It provides endless ways to piss off your developers with a strict format that YOU repo owner are free to standardize.
Usually commits must start with `TYPE(SCOPE): ` followed by the summary. But then you can force that summary to start with a lowercase or an uppercase and to make sure that it ends with a dot, or whatever.
* It does not work well with GitHub and other cloud SCM, because the only way to make it less unbearable to devs is to check the commit message BEFORE it's saved on the server. It's called a `pre-commit hook` and can only be set on on-premise SCM servers, AFAIK.
Otherwise, well, have fun amending and force-push your commits.
* It does not work well with git, or any tool that prepare commits for you (the code editor from your SCM website, Github desktop, etc.)
because, well, when for example you run `git merge` a nice commit message will be made for you but git could not care less about Conventinal Commits™.

And that's it, I'm done and you should too at this point, let's not beat a dead dog.
