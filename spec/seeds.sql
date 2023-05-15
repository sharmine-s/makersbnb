CREATE TABLE IF NOT EXISTS listings (
  id SERIAL PRIMARY KEY,
  title text,
  description text,
  img text,
  price money,
  location text,
  user_id int
);
