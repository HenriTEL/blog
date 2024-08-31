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
- You may or may not have access to a copy of global variables, depending on the start method. If you want to share those variable, you need to use specific data structures. You can also use other communication methods but they'll require serialization, which can be hard depending on the objects you want to share. Things are much easier with threads.
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

Use to run a few (<500) independant I/O bound tasks.

**Pros:**

- Spawning threads is cheap and predictible, since they share memory, communication is also cheap and easy.

**Cons:**

- It's easy to introduce race conditions and difficult to spot them. Reasoning about the code exponentially more difficult.  
- Threads are OS resources which mean not everything is under your control.
- Due to the Global Interpreter Lock limitation, only one thread will execute code at a time, making this technique useless for CPU bound tasks. It will also be less efficient than async code, as the OS can stop a thread that was still busy and schedule another one, leading to more unnecessary context switches.

