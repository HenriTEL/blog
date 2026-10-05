# CI Done Right

* Write CI logic in your own code. Language does not matter as long as it is proper, maintainable code.
* Make it possible to run your pipelines locally on a developer machine, otherwise testing/debugging becomes a nightmare.
* Avoid YAML.
* Don't bind yourself to some fancy new thing that will solve CI once and for all (see: earthly, dagger, etc.)
* Use your own runners, on-premise if possible
