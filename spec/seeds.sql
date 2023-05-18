DROP TABLE users, listings, dates, requests;

CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

CREATE TABLE IF NOT EXISTS listings (
  id SERIAL PRIMARY KEY,
  title text,
  description text,
  img text,
  price money,
  location text,
  user_id int,
    constraint fk_user foreign key(user_id) references users(id) on delete cascade
);

CREATE TABLE IF NOT EXISTS dates (
  id SERIAL PRIMARY KEY,
  listing_id int,
    constraint fk_listing foreign key(listing_id) references listings(id) on delete cascade,
  date date,
  guest_id int,
    constraint fk_user foreign key(guest_id) references users(id) on delete cascade
);

CREATE TABLE IF NOT EXISTS requests (
  id SERIAL PRIMARY KEY,
  listing_id int,
    constraint fk_listing foreign key(listing_id) references listings(id) on delete cascade,
  date date,
  guest_id int,
    constraint fk_user foreign key(guest_id) references users(id) on delete cascade
);