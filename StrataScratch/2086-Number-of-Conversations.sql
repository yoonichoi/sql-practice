-- 2086. Number of Conversations
-- Level: Medium

-- Count the total number of distinct conversations on WhatsApp. 
-- Two users share a conversation if there is at least 1 message between them. 
-- Multiple messages between the same pair of users are considered a single conversation.

with cte as (
    select distinct message_sender_id,
            message_receiver_id
        from whatsapp_messages
    union
    select distinct message_receiver_id,
            message_sender_id
        from whatsapp_messages
)
select count(*)/2 as conv
    from cte