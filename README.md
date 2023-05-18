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

## Dates Table
When calling the `create` method for any date ensure that `guest_id` is null, as this gets populated only once the booking has been confirmed.

To ensure that each listing is unique make sure that `date` and `listing` are not the same in an existing entry.
Be aware of the date format we are using which is 'YYYY-MM-DD'.

## Requests Table
When a request is made a new request record is added into the table. 
Once a request is confirmed, delete that request from the table.
A request table only contains pending requests. 


## User Table
when working with the user table note that the listing table depends on the user table and the  dates table relies on the user and the listings tables.
