-- SELECT * FROM users

-- SELECT * FROM posts

-- SELECT * FROM comments

-- SELECT * FROM likes

-- SELECT * FROM followers



-- Finding all the users who have commented on post_id 1
SELECT name
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Comments
    WHERE post_id = 1
);


-- Finding all the users who have liked post_id 1
SELECT name
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Likes
    WHERE post_id = 1
);


-- What is the average number of likes per post?
SELECT AVG(num_likes) AS avg_likes
FROM (
    SELECT COUNT(Likes.like_id) AS num_likes
    FROM Posts
    LEFT JOIN Likes ON Posts.post_id = Likes.post_id
    GROUP BY Posts.post_id
) AS likes_by_post;


-- Find all the comments and their user names
WITH comment_users AS (
    SELECT Comments.comment_text, Users.name
    FROM Comments
    JOIN Users ON Comments.user_id = Users.user_id
)
SELECT *
FROM comment_users;


-- Find all the post and their comments
WITH post_comments AS (
    SELECT Posts.caption, Comments.comment_text
    FROM Posts
    LEFT JOIN Comments ON Posts.post_id = Comments.post_id
)
SELECT *
FROM post_comments;


-- Which user has the most followers?
SELECT name, COUNT(Followers.follower_id) AS num_followers
FROM Users
LEFT JOIN Followers ON Users.user_id = Followers.user_id
GROUP BY name, Users.user_id
ORDER BY num_followers DESC


-- Ranking the posts based on the number of likes
SELECT post_id, num_likes, RANK() OVER (ORDER BY num_likes DESC) AS rank
FROM (
    SELECT Posts.post_id, COUNT(Likes.like_id) AS num_likes
    FROM Posts
    LEFT JOIN Likes ON Posts.post_id = Likes.post_id
    GROUP BY Posts.post_id
) AS likes_by_post;


-- Finding all the posts and their comments using a Common Table Expression (CTE)
WITH post_comments AS (
    SELECT Posts.post_id, Posts.caption, Comments.comment_text
    FROM Posts
    LEFT JOIN Comments ON Posts.post_id = Comments.post_id
)
SELECT *
FROM post_comments;