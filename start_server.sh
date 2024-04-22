#!/bin/bash

# Change directory to your Rails app
cd /var/www/BHT-EMR-API/

# Load RVM in the script
source /home/meduser/.rvm/scripts/rvm

# Install dependencies
bundle install --local

# Use RVM to select Ruby version
rvm use ruby-3.2.0

# Start Rails server
rails server -b 0.0.0.0 -p 3002 -e development
