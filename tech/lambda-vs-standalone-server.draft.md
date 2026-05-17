Lambda
+ Toggle debug logs
+ Immune to long-running programs specific bugs like memory leaks
- Caching
- Latency due to startup time, opening DB connection, etc.
- Execution is delayed to first request hiding startup bugs
- Can't manually log to the instance and update the live code e.g. to add more logging
- Cold start latency
- Health checks harder to put in place, not suitable for blue-green and slowroll deployents
