CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255)
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE, 
  -- NOT NULL ^
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  thumbnail_photo_url VARCHAR(255) NOT NULL,
  cover_photo_url VARCHAR(255) NOT NULL,
  cost_per_night MONEY NOT NULL, 
  street VARCHAR(255) NOT NULL,
  park_spaces SMALLINT NOT NULL,
  number_of_bathrooms SMALLINT NOT NULL,
  number_of_bedrooms SMALLINT NOT NULL,
  country VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL,
  post_code VARCHAR(20) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true
  -- NOT NULL^ 
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  -- NOT NULL ^
  property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE
  -- NOT NULL ^
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  reservation_id INTEGER NOT NULL REFERENCES reservations(id) ON DELETE CASCADE NOT NULL,
  property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE NOT NULL,
  rating SMALLINT NOT NULL,
  message TEXT
);



-- ADD IN NOT NULL