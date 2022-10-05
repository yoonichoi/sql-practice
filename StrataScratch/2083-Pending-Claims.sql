-- 2083. Pending Claims
-- Level: Easy

-- Count how many claims submitted in December 2021 are still pending. 
-- A claim is pending when it has neither an acceptance nor rejection date.

-- cvs_claims
-- claim_id: int
-- account_id: varchar
-- date_submitted: datetime
-- date_accepted: datetime
-- date_rejected: datetime

select count(claim_id) from cvs_claims
where date_accepted is NULL and date_rejected is NULL 
    and left(date_submitted,7)='2021-12'
