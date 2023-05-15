# MakersBnB Project Seed

This repo contains the seed codebase for the MakersBnB project in Ruby (using Sinatra and RSpec).

Someone in your team should fork this seed repo to their Github account. Everyone in the team should then clone this fork to their local machine to work on it.

## Setup

```bash
# Install gems
bundle install

#create database on command line
createdb makersbnb
createdb makersbnb_test
psql -h 127.0.0.1 makersbnb < spec/seeds.sql
psql -h 127.0.0.1 makersbnb_test < spec/seeds.sql
psql -h 127.0.0.1 makersbnb < spec/seeds_listings.sql
psql -h 127.0.0.1 makersbnb_test < spec/seeds_listings.sql


# Run the tests
rspec

# Run the server (better to do this in a separate terminal).
rackup
```
