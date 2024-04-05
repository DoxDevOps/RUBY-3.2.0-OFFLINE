#!/bin/bash

# Step 1: Extract the file
sudo tar -xvf ruby-3.2.0.tar.bz2

# Step 2: Copy Ruby to RVM directory if it does not exist
if [ ! -d "/usr/share/rvm/rubies/ruby-3.2.0" ]; then
    sudo cp -r ruby-3.2.0 /usr/share/rvm/rubies/
else
    echo "Ruby directory already exists in RVM directory. Skipping copy...."
fi

# Step 3: Copy Ruby directory to ~/.rvm/wrappers if it does not exist
if [ ! -d "$HOME/.rvm/wrappers/ruby-3.2.0" ]; then
    cp -r ruby-3.2.0 "$HOME/.rvm/wrappers"
else
    echo "Ruby directory already exists in wrappers. Skipping copy...."
fi
# Step 3: Copy Ruby directory to ~/.rvm/rubies if it does not exist
if [ ! -d "$HOME/.rvm/rubies/ruby-3.2.0" ]; then
    cp -r ruby-3.2.0 "$HOME/.rvm/rubies/"
elif [ ! -d "$HOME/.rvm/rubies" ]; then
    echo "Rubies directory not found. Skipping copy...."
else
    echo "Ruby directory already exists in ~/.rvm/rubies directory"
fi

# Step 4: Source RVM script to ensure proper initialization
source "$HOME/.rvm/scripts/rvm"

# Step 5: Regenerate RVM wrappers
rvm wrapper regenerate
# Step 6 : Create gemset
rvm use ruby-3.2.0@my_gemset --create
echo "Gemset created"

# Step 7 : use 3.2.0
rvm use ruby-3.2.0@my_gemset
echo "RVM use to Ruby-3.2.0"
