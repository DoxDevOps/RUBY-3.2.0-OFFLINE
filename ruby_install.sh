#!/bin/bash

# Step 1: Extract the file
sudo tar -xvf ruby-3.2.0.b2z

# Step 2: Copy Ruby to RVM directory if not exists
if [ ! -d "/usr/share/rvm/rubies/ruby-3.2.0" ]; then
    sudo cp -r ruby-3.2.0 /usr/share/rvm/rubies/
else
    echo "Ruby directory already exists in RVM directory. Skipping copy...."
fi

# Step 3: Copy Ruby directory to ~/.rvm/wrappers if not exists
if [ ! -d "$HOME/.rvm/wrappers/ruby-3.2.0" ]; then
    cp -r ruby-3.2.0 "$HOME/.rvm/wrappers"
else
    echo "Ruby directory already exists in wrappers directory. Skipping copy...."
fi

# Step 4: Source RVM script to ensure proper initialization
source "$HOME/.rvm/scripts/rvm"

# Step 5: Regenerate RVM wrappers
rvm wrapper regenerate