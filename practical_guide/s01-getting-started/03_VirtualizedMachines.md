# Virtual Machines

A virtually emulated Operating System running on your operating system.

Pros:
* Allow separated environments
* Environment-specific configurations are possible
* Environment configurations can be shared and reproduced reliably

Cons:
* Redundant duplication, waste of space
* Performance can be slow, boot times can be long.
* Reproducing on another computer server is possible but may be tricky.

## Docker

Docker runs on a Docker Engine, which runs on an OS Built-In / Emulated container support.  
Containers run on top of the Docker Engine.

## Containers vs Virtual Machines

Containers: 
* Low impact on OS, very fast, minimal disk space usage
* Sharing, re-building and distribution is easy
* Encapsulated apps/environments instead of whole machines.

Virtual Machines:
* Bigger impact on OS, slower, higher disk space usage.
* Sharing, re-building and distribution can be challenging.
* Encapsulate "whole machines" instead of just apps/environments.
