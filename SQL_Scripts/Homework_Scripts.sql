--All transactions per Card Holder
SELECT cc.cardholder_id, t.id, t.date, t.amount, t.card, t.id_merchant 
FROM transaction t JOIN credit_card cc
ON (t.card = cc.card) AND (cc.cardholder_id = 2)
ORDER BY cc.cardholder_id, t.date;

--Top 100 transactions from 7am to 9am
SELECT cc.cardholder_id, t.id, t.date, t.amount, t.card, t.id_merchant 
FROM transaction t JOIN credit_card cc
ON (t.card = cc.card)
WHERE (extract(hour from t.date) >= 7) AND (extract(hour from t.date) <= 9)
ORDER BY t.amount DESC LIMIT 100;

--Number transactions per Card Holder < $2.00
SELECT cc.cardholder_id, count(t.id) 
FROM transaction t JOIN credit_card cc
ON (t.card = cc.card)
WHERE t.amount < 2
GROUP by cc.cardholder_id
ORDER BY cc.cardholder_id;

--Number transactions per Merchant < $2.00 - TOP 5
SELECT id_merchant, count(id) 
FROM transaction
WHERE amount < 2
GROUP by id_merchant
ORDER BY count(id) DESC LIMIT 5;

--View - All transactions per Card Holders
CREATE VIEW card_holders_transactions AS
SELECT cc.cardholder_id, t.id, t.date, t.amount, t.card, t.id_merchant 
FROM transaction t JOIN credit_card cc
ON (t.card = cc.card)
ORDER BY cc.cardholder_id, t.date;