This repository is being used for testing purpose.

The idea is to have an application `app.py` which does generate `JSON` formatted log output.
This log output will be take by logging solution and shipped into a centralized logging solution
for review.

With this testing applicaiton, we should be able to verify functionality and behavior with `JSON` formatted
log messages.

The `run.sh` script is simply the `CMD` within the `Dockerfile` to run the application
and keep it easily running in a loop.

The `Dockerfile` is using `fedora:latest` image to run the workload.