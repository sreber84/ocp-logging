#!/bin/bash

#
# Run app.py to generate massive amount of log data in JSON format
while [ true ]
do
  python /opt/app.py
  sleep 1
done

exit 0