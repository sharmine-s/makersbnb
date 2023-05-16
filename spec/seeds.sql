DROP TABLE dates;
DROP TABLE listings;

CREATE TABLE IF NOT EXISTS listings (
  id SERIAL PRIMARY KEY,
  title text,
  description text,
  img text,
  price money,
  location text,
  user_id int
);

CREATE TABLE IF NOT EXISTS dates (
  id SERIAL PRIMARY KEY,
  listing_id int,
    constraint fk_listing foreign key(listing_id) references listings(id) on delete cascade,
  date date,
  requested boolean,
  guest_id int,
  confirmed boolean
);
CREATE TABLE IF NOT EXISTS dates (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  
  listing_id int,
    constraint fk_listing foreign key(listing_id) references listings(id) on delete cascade,
  date date,
  requested boolean,
  guest_id int,
  confirmed boolean
);
