--card_Holder Table Creation
CREATE TABLE IF NOT EXISTS card_holder(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

--credit_card Table Creation
--Relationship n-1 with card_holder
CREATE TABLE IF NOT EXISTS credit_card(
	card BIGINT PRIMARY KEY,
	cardholder_id INTEGER NOT NULL,
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

--merchant_category Table Creation
CREATE TABLE IF NOT EXISTS merchant_category(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

--merchant Table Creation
--Relationship n-1 with merchant_category
CREATE TABLE IF NOT EXISTS merchant(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	id_merchant_category INTEGER NOT NULL,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

--transaction Table Creation
--Relationship n-1 with merchant_category
--Relationship n-1 with credit_card
CREATE TABLE IF NOT EXISTS transaction(
	id INTEGER,
	date TIMESTAMP,
	PRIMARY KEY (id, date),
	amount NUMERIC NOT NULL,
	card BIGINT NOT NULL,
	id_merchant INTEGER NOT NULL,
	FOREIGN KEY (id_merchant) REFERENCES merchant(id),
	FOREIGN KEY (card) REFERENCES credit_card(card)
);
