-- Inserting into Users table

INSERT INTO Users (user_id, name, email, phone_number)
VALUES
    (1, 'Shimanto', 'chess@gmail.com', '1234567890'),
    (2, 'Sazzad', 'MH@yahoo.com', '0987654321'),
    (3, 'Tareq', 'footballer@gmail.com', '1112223333'),
    (4, 'Samrat', 'firstboy@yahoo.com', '1242525252'),
    (5, 'Niloy', 'duronto@gmail.com', '5556667777');


-- Inserting into Posts table

INSERT INTO Posts (post_id, user_id, caption, image_url)
VALUES
    (1, 1, 'Beautiful sunset', '<https://www.example.com/sunset.jpg>'),
    (2, 2, 'My new puppy', '<https://www.example.com/puppy.jpg>'),
    (3, 3, 'Delicious pizza', '<https://www.example.com/pizza.jpg>'),
    (4, 4, 'Throwback to my vacation', '<https://www.example.com/vacation.jpg>'),
    (5, 5, 'Amazing concert', '<https://www.example.com/concert.jpg>');


-- Inserting into Comments table

INSERT INTO Comments (comment_id, post_id, user_id, comment_text)
VALUES
    (1, 1, 2, 'Wow! Stunning.'),
    (2, 1, 3, 'Beautiful colors.'),
    (3, 2, 1, 'What a cutie!'),
    (4, 2, 4, 'Aww, I want one.'),
    (5, 3, 5, 'Yum!'),
    (6, 4, 1, 'Looks like an awesome trip.'),
    (7, 5, 3, 'Wish I was there!');


-- Inserting into Likes table

INSERT INTO Likes (like_id, post_id, user_id)
VALUES
    (1, 1, 2),
    (2, 1, 4),
    (3, 2, 1),
    (4, 2, 3),
    (5, 3, 5),
    (6, 4, 1),
    (7, 4, 2),
    (8, 4, 3),
    (9, 5, 4),
    (10, 5, 5);


-- Inserting into Followers table

INSERT INTO Followers (follower_id, user_id, follower_user_id)
VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 1, 3),
    (4, 3, 1),
    (5, 1, 4),
    (6, 4, 1),
    (7, 1, 5),
    (8, 5, 1);




-- Updating the caption of post_id 3

UPDATE Posts
SET caption = 'Best pizza ever'
WHERE post_id = 3;