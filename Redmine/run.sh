#!/bin/bash
cd /home/ubuntu/redmine-5.1.5
rm -f tmp/pids/server.pid
bundle exec rails server -e production
