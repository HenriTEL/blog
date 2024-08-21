# AsyncIO vs Multi Threading vs Multi Processing

> Those are the 3 big options to speed up python code.
> The globally accepted answer on the internet focuses on resources bound to help you decide.
> I think inter task dependencies and code complexity should also be taken into account.

## Multi Processing

Use for independant CPU bound tasks.

**Pros:**

- No GIL limitations.


**Cons:**

- The synchronization points between tasks might not be obvious, leading to race conditions. They also make reasoning about the code exponentially more difficult.  
- Processes are OS resources which mean not everything is under your control.  
- There is a significant memory and compute overhead to spawn and communicate between processes.

## AsyncIO

Use for I/O Bound tasks either:  
* When you run many tasks concurrently (>500)
* When some non-trivial synchronization between tasks is needed (i.e. to avoid resource starvation, dead-locks and race conditions)
* When you need fine grain control over the lifecycle of your executor

**Pros:**

- There is virtually no memory and time overhead to switch between tasks compared to threads.  
- Because all the non-blocking parts of the code are still synchronous it's much easier to reason about the code and many race conditions issues just can't happen.  
- It usually lower memory usage since as soon as you get a result that consumes a lot of memory, the task can take over to process it so that it can be garbage collected. 
 
**Cons:**

- Async code will infect the rest of your codebase. There is a significant overhead to work with an async codebase compared to synchronous code.  
- It's easy to forget an await and debugging your event loops can be tricky, there is a a steep learning curve to understand what's behind the magic.  

## Multi Threading

Use to run a few (<500) independant I/O bound tasks

**Pros:**

- Spawning threads is cheap and predictible, since they share memory, communication is also cheap and easy, as long as you don't have race conditions.

**Cons:**

- The synchronization points required between tasks might not be obvious and makes reasoning about the code exponentially more difficult.  
- Threads are OS resources which mean not everything is under your control.

