## Logging

* Log all major logical branches within code (if/for)
* Log events after the fact. For example "uploaded file [...]" instead of "uploading file [...]"  
* Use info level for meaningful logs from a business perspective, typically decisions taken and results of intermediary steps.
* Use debug logging in hot code.
* if "request" span multiple machine in cloud infrastructure, include request ID in all so logs can be grouped
* if possible make log level dynamically controlled, so grug can turn on/off when need debug issue (many!)
* if possible make log level per user, so can debug specific user issue
