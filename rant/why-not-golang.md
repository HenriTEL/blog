# Reasons to Not Use the Go Programming Language

> Some of the reasons that makes go a no go.

Those reasons were mostly found on this [HN thread](https://news.ycombinator.com/item?id=42083547).  

> The error handling is one of the worst parts of Go for me.
> Every call that can fail ends up being followed by 3 lines of error handling even if it's just propagating the error up.
> The actual logic get drowned out.

> For a language that's supposed to be easy to learn, it made sooooo many weird decisions, seemingly just to be quirky.
> Every single other C-ish language declares types either as "String thing" or "thing: String".
> For no sane reason at all, Go went with "thing String". etc. etc.

> I've had to use go occasionally and it feels like the language is designed to stop me from achieving my goals.
> The standard library is unimpressive (to be generous), it has plenty of footguns like C but none of its flexibility.
> Also for some reason parenthesis AND `\n` are required. So you get the worse of C and python there.

> Newer versions of Java are much more enjoyable to work with versus Go.

> Go's abstraction makes it simple to use but often those abstractions fall off when you leave the _typical server™_ environment go's creators had in mind when they designed the language.
> For [example](https://fasterthanli.me/articles/i-want-off-mr-golangs-wild-ride) not every filesystem is Unix compliant and not every path is a string.
