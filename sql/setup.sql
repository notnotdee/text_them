DROP TABLE IF EXISTS messages;

CREATE TABLE messages(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    recipient TEXT NOT NULL, -- the person you're sending this message to
    message_content TEXT NOT NULL, -- the content of the message
    edited BOOLEAN DEFAULT FALSE, -- a flag for whether or not the message has been edited
    created_at TIMESTAMP DEFAULT NOW(), -- time the message was created
    updated_at TIMESTAMP DEFAULT NOW() -- time the message was updated
);

