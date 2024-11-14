# Reasons to Not Use the Go Programming Language

> Some of the reasons that makes go a no go.

Go has some incredible features: it produces single binaries, is fast to compile, statically typed, has test, formatting and documentation solved for you, it also executes fast with memory managed by a GC. It's syntax is simple, and was designed with concurrency in mind. Are you not entertained enough?!
No, here they are, reasons that repeals people. Mostly from this [HN thread](https://news.ycombinator.com/item?id=42083547). 

> The error handling is one of the worst parts of Go for me.
> Every call that can fail ends up being followed by 3 lines of error handling even if it's just propagating the error up.
> The actual logic get drowned out.

> For a language that's supposed to be easy to learn, it made sooooo many weird decisions, seemingly just to be quirky.
> Every single other C-ish language declares types either as "String thing" or "thing: String".
> For no sane reason at all, Go went with "thing String". etc. etc.

I also find the way to define methods strange.

> I've had to use go occasionally and it feels like the language is designed to stop me from achieving my goals.
> The standard library is unimpressive (to be generous), it has plenty of footguns like C but none of its flexibility.
> Also for some reason parenthesis AND `\n` are required. So you get the worse of C and python there.

> Newer versions of Java are much more enjoyable to work with versus Go.

Go's abstraction makes it simple to use but often those abstractions fall off when you leave the _typical server™_ environment go's creators had in mind when they designed the language.  
For [example](https://fasterthanli.me/articles/i-want-off-mr-golangs-wild-ride) not every filesystem is Unix compliant and not every path is a string.

Things I like from other languages like rust and python is that the standard library is massive and the language is multi-paradigm. It means there are plenty of ways to implement the same thing. A downside is that there's more to learn compared to a language like go. You also spend more time looking for the right implementation style. Examples include inheritance, composition, duck typing, decorators, macros, generics, etc.
When you combine those things you get a very powerful toolset that not only help you implement the solution but help you find better designs as you gain experience. On the other hand go is more limited in coding styles and that does not prevent bad designs. For example, it being designed with concurrency in mind does not mean that your code will be concurrent by default.