SELECT *
FROM marketing_data;

-- Identify the null values from the data set using income as the criteria
SELECT COUNT(*)
FROM marketing_data
WHERE income ISNULL;


-- Total sum of products purchases through web purchases
SELECT 
	SUM(web_purchases)
FROM marketing_data;

-- Total number of wine purchases made through the web
SELECT
	SUM(web_purchases)
FROM marketing_data
WHERE amount_wines IN (web_purchases);


-- most performing product
SELECT
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data;


-- Amout spent on purchases through the web
SELECT 
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
WHERE web_purchases IN ("amount_wines", 
						amount_fruits,
						amout_meat_prod,
						amount_fish_prod,
						amount_sweets,
						amount_gold_prods);
						
-- Count of discount recieved from web purchases
SELECT
	SUM(discount_purchases)
FROM marketing_data
WHERE web_purchases IN(discount_purchases);

-- Number of web purchases associated with each campaign
SELECT 
	SUM(accepted_cmp3) Campaign_3,
	SUM(accepted_cmp4) Campaign_4,
	SUM(accepted_cmp5) Campaign_5,
	SUM(accepted_cmp1) Campaign_1,
	SUM(accepted_cmp2) Campaign_2
FROM marketing_data
WHERE web_purchases IN (accepted_cmp3,
						accepted_cmp4,
						accepted_cmp5,
						accepted_cmp1,
						accepted_cmp2);

-- Total sales made from each campaign
-- Campaign_1
SELECT 
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
WHERE accepted_cmp1 IN ("amount_wines", 
						amount_fruits,
						amout_meat_prod,
						amount_fish_prod,
						amount_sweets,
						amount_gold_prods);
						
-- Campaign_2						
SELECT 
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
WHERE accepted_cmp2 IN ("amount_wines", 
						amount_fruits,
						amout_meat_prod,
						amount_fish_prod,
						amount_sweets,
						amount_gold_prods);	
	
-- Campaign_3
SELECT 
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
WHERE accepted_cmp3 IN ("amount_wines", 
						amount_fruits,
						amout_meat_prod,
						amount_fish_prod,
						amount_sweets,
						amount_gold_prods);
						
-- Campaign_4						
SELECT 
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
WHERE accepted_cmp4 IN ("amount_wines", 
						amount_fruits,
						amout_meat_prod,
						amount_fish_prod,
						amount_sweets,
						amount_gold_prods);	
						
-- Campaign_5						
SELECT 
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
WHERE accepted_cmp5 IN ("amount_wines", 
						amount_fruits,
						amout_meat_prod,
						amount_fish_prod,
						amount_sweets,
						amount_gold_prods);		
						
						
-- Average spending by birth year
SELECT
	year_birth,
	ROUND(AVG(amount_wines)) Wine, 
	ROUND(AVG(amount_fruits)) Fruits,
	ROUND(AVG(amout_meat_prod)) Meat,
	ROUND(AVG(amount_fish_prod)) Fish,
	ROUND(AVG(amount_sweets)) Sweets,
	ROUND(AVG(amount_gold_prods)) Gold
FROM marketing_data
GROUP BY year_birth
ORDER BY year_birth DESC;

-- total product pruchases for each year
SELECT
	date_customer,
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
WHERE date_customer IN (2012, 2013,2014)
GROUP BY date_customer;

-- Count of marital status and kid_home
SELECT
	marital_status,
	COUNT(marital_status),
	kid_home
FROM marketing_data
GROUP BY kid_home,marital_status
ORDER BY marital_status;


-- Count of marital status by teen home
SELECT
	marital_status,
	COUNT(marital_status),
	teen_home
FROM marketing_data
GROUP BY marital_status, teen_home
ORDER BY marital_status;

-- Sum of income by education
SELECT
	education,
	SUM(income) "Income"
FROM marketing_data
GROUP BY education
ORDER BY "Income" DESC;

-- Sum of income by marital status
SELECT
	marital_status,
	SUM(income) "Income"
FROM marketing_data
GROUP BY marital_status
ORDER BY "Income" ASC;

-- Sum of income from kid home and teen home
SELECT 
	SUM(income),
	kid_home, teen_home
FROM marketing_data
GROUP BY kid_home,teen_home;

-- Discount by education
SELECT
	education,
	SUM(discount_purchases)
FROM marketing_data
GROUP BY education;

-- Sum of discount by marital status
SELECT
	marital_status,
	SUM(discount_purchases)
FROM marketing_data
GROUP BY marital_status;

-- web visits by marital _status
SELECT
	marital_status,
	COUNT(web_visits_month) Visits
FROM marketing_data
GROUP BY marital_status
ORDER BY Visits DESC;


-- web visits by education
SELECT
	education,
	COUNT(web_visits_month) Visits
FROM marketing_data
GROUP BY education
ORDER BY Visits DESC;

-- web visits by year
SELECT
	date_customer,
	COUNT(web_visits_month) Visits
FROM marketing_data
GROUP BY date_customer
ORDER BY Visits DESC;


SELECT 
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold,
	SUM(web_purchases) web, 
	SUM(catalogue_purchases) catalogue,
	SUM(store_purchases) store
FROM marketing_data;


SELECT
	country,
	SUM(income) "Income"
FROM marketing_data
GROUP BY country
ORDER BY "Income" DESC;


-- purchases by country
SELECT 
	country,
	SUM(amount_wines) Wine, 
	SUM(amount_fruits) Fruits,
	SUM(amout_meat_prod) Meat,
	SUM(amount_fish_prod) Fish,
	SUM(amount_sweets) Sweets,
	SUM(amount_gold_prods) Gold
FROM marketing_data
GROUP BY country;


SELECT 
	SUM(complain)
FROM market_data