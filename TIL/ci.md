## CI Done Right

* Write as much CI logic as possible in your own code. Does not really matter what you use as long as it is proper, maintainable code.
* Make it possible to run your pipelines locally on a developer machine, as much as possible, otherwise testing/debugging becomes a nightmare.
* Avoid YAML as much as possible, period.
* Don't bind yourself to some fancy new VC-financed thing that will solve CI once and for all but needs to get monetized eventually (see: earthly, dagger, etc.)
* Use your own runners, on-premise if possible
