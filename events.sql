CREATE TABLE tickets (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  event_id INTEGER,
  quantity INTEGER

  FOREIGN KEY(event_id) REFERENCES events(id)
);

CREATE TABLE events (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  user_id INTEGER

  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

INSERT INTO
  users (id, username, fname, lname)
VALUES
  (1, "sbrice", 'Stephan', 'Brice'),
  (2, "rjoseph", 'Roland', 'Joseph');

INSERT INTO
  events (id, title, user_id)
VALUES
  (1, "Alpha dinner on July 4",  1),
  (2, "New sales in mexico", 1),
  (3, "Dancing with the stars", 2),
  (4, "Modelise with ease",  2);

INSERT INTO
  tickets (id, name, type, event_id, quantity)
VALUES
  (1,'FREE TICKET TO ALPHA DINNER', "FREE", 1, 10),
  (2,'DONATION TICKET TO MEXICO SALES', "DONATION",2, 10),
  (3,'Dancing with the stars paid ticket', "PAID", 3, 10);
  (4, 'Ticket to the modelise with ease webinar',"PAID", 4, 10);
