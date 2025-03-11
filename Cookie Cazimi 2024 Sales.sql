-- WRITE OUT ALL SELECT STATEMENTS FOR CONVENIENCE
SELECT * FROM venue v;
SELECT * FROM date_sold ds;
SELECT * FROM product_sold ps;
SELECT * FROM product_name pn;
SELECT * FROM product_category pc;
SELECT * FROM product_base_flavor pbf;
SELECT * FROM product_ingredients pi;
SELECT * FROM add_in ai;
SELECT * FROM add_in_category aic;

-- REPLACE FOREIGN KEYS WITH NAMES FOR CONVENIENCE
-- DATE SOLD
SELECT ds.id AS ds_id, ds.ds_date, v.v_name
FROM date_sold ds 
JOIN venue v ON ds.v_id = v.id
ORDER BY ds.id;
-- PRODUCT SOLD
SELECT ps.id AS ps_id, ds.ds_date, pn.pn_name, ps.units 
FROM product_sold ps 
JOIN date_sold ds ON ps.ds_id = ds.id 
JOIN product_name pn ON ps.pn_id = pn.id
ORDER BY ps.id;
-- PRODUCT NAME
SELECT pn.id AS pn_id, pn.pn_name, pc.pc_name 
FROM product_name pn 
JOIN product_category pc ON pn.pc_id = pc.id
ORDER BY pn.id;
-- PRODUCT CATEGORY
SELECT pc.id AS pc_id, pc.pc_name, pbf.pbf_name
FROM product_category pc 
JOIN product_base_flavor pbf ON pc.pbf_id = pbf.id
ORDER BY pc.id;
-- PRODUCT BASE FLAVOR N/A
-- PRODUCT INGREDIENTS
SELECT pi.id AS pi_id, pn.pn_name, ai.ai_name, aic.aic_name
FROM product_ingredients pi 
JOIN product_name pn ON pi.pn_id = pn.id 
JOIN add_in ai ON pi.ai_id = ai.id 
JOIN add_in_category aic ON ai.aic_id = aic.id
ORDER BY pi.id;
-- ADD IN
SELECT ai.id AS ai_id, ai.ai_name, aic.aic_name
FROM add_in ai 
JOIN add_in_category aic ON ai.aic_id = aic.id
ORDER BY ai.id;
-- ADD IN CATEGORY N/A

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HOW MANY UNITS OF PRODUCT DID I SELL IN TOTAL?
SELECT SUM(ps.units) AS total_units_sold
FROM product_sold ps
;

-- HOW MANY UNITS OF PRODUCT DID I SELL AT EACH VENUE?
SELECT 
	v.v_name, 
	SUM(ps.units) AS total_units_sold
FROM product_sold ps
JOIN date_sold ds ON ps.ds_id = ds.id 
JOIN venue v ON ds.v_id = v.id
GROUP BY v.v_name
;

-- HOW MANY UNITS OF EACH PRODUCT DID I SELL?
SELECT pn.pn_name, SUM(ps.units) AS total_units_sold
FROM product_name pn
	JOIN product_sold ps ON pn.id = ps.pn_id
	JOIN date_sold ds ON ps.ds_id = ds.id 
GROUP BY pn.pn_name
ORDER BY total_units_sold DESC
;


-- HOW MANY UNITS OF EACH PRODUCT DID EACH VENUE SELL? COMPARE TO HOW MANY TOTAL NUMBER OF UNITS SOLD
SELECT 
    pn.pn_name,
	COALESCE(SUM(CASE WHEN ds.v_id = 1 THEN ps.units ELSE 0 END), 0) AS units_sold_v1,
	COALESCE(SUM(CASE WHEN ds.v_id = 2 THEN ps.units ELSE 0 END), 0) AS units_sold_v2,
	COALESCE(SUM(ps.units), 0) AS total_units_sold
FROM product_name pn
	LEFT JOIN product_sold ps ON pn.id = ps.pn_id
	LEFT JOIN date_sold ds ON ps.ds_id = ds.id 
GROUP BY pn.pn_name
ORDER BY total_units_sold DESC
;

-- WHICH PRODUCTS DID I SELL NONE OF AT NEITHER VENUE?
SELECT pn.pn_name
FROM product_name pn
	LEFT JOIN product_sold ps ON pn.id = ps.pn_id
	LEFT JOIN date_sold ds ON ps.ds_id = ds.id 
WHERE ps.units IS NULL
GROUP BY pn.pn_name
;


-- GROUP THE MOST POPULAR PRODUCT BASE FLAVOR
SELECT 
	pbf.pbf_name, 
	COALESCE(SUM(CASE WHEN ds.v_id = 1 THEN ps.units ELSE 0 END), 0) AS units_sold_v1,
	COALESCE(SUM(CASE WHEN ds.v_id = 2 THEN ps.units ELSE 0 END), 0) AS units_sold_v2,
	COALESCE(SUM(ps.units), 0) AS total_units_sold
FROM product_name pn
	JOIN product_sold ps ON pn.id = ps.pn_id
	JOIN product_category pc ON pn.pc_id = pc.id
	JOIN product_base_flavor pbf ON pc.pbf_id = pbf.id
	JOIN date_sold ds ON ps.ds_id = ds.id 
GROUP BY pbf.pbf_name
ORDER BY total_units_sold DESC
;


-- FIND THE MOST POPULAR ADD-INS
SELECT 
	ai.ai_name, 
	aic.aic_name,
	COALESCE(SUM(CASE WHEN ds.v_id = 1 THEN ps.units ELSE 0 END), 0) AS units_sold_v1,
	COALESCE(SUM(CASE WHEN ds.v_id = 2 THEN ps.units ELSE 0 END), 0) AS units_sold_v2,
	COALESCE(SUM(ps.units), 0) AS total_units_sold
FROM product_name pn
	JOIN product_ingredients pi ON pn.id = pi.pn_id
	JOIN product_sold ps ON pn.id = ps.pn_id
	JOIN product_category pc ON pn.pc_id = pc.id
	JOIN product_base_flavor pbf ON pc.pbf_id = pbf.id
	JOIN date_sold ds ON ps.ds_id = ds.id 
	JOIN add_in ai ON pi.ai_id = ai.id 
	JOIN add_in_category aic ON ai.aic_id = aic.id
GROUP BY
	ai.ai_name, 
	aic.aic_name,
	pbf.pbf_name
ORDER BY 
total_units_sold DESC
--	units_sold_v2 DESC
-- units_sold_v1 DESC
;



-- FIND THE MOST POPULAR ADD-INS FOR THE TOP PRODUCT BASE FLAVOR: SIGNATURE
SELECT 
	ai.ai_name, 
	aic.aic_name,
	COALESCE(SUM(CASE WHEN ds.v_id = 1 THEN ps.units ELSE 0 END), 0) AS units_sold_v1,
	COALESCE(SUM(CASE WHEN ds.v_id = 2 THEN ps.units ELSE 0 END), 0) AS units_sold_v2,
	COALESCE(SUM(ps.units), 0) AS total_units_sold
FROM product_name pn
	JOIN product_ingredients pi ON pn.id = pi.pn_id
	JOIN product_sold ps ON pn.id = ps.pn_id
	JOIN product_category pc ON pn.pc_id = pc.id
	JOIN product_base_flavor pbf ON pc.pbf_id = pbf.id
	JOIN date_sold ds ON ps.ds_id = ds.id 
	JOIN add_in ai ON pi.ai_id = ai.id 
	JOIN add_in_category aic ON ai.aic_id = aic.id
WHERE pbf.pbf_name = 'Signature'
GROUP BY
	ai.ai_name, 
	aic.aic_name,
	pbf.pbf_name
ORDER BY 
	total_units_sold DESC
--	units_sold_v2 DESC
--	units_sold_v1 DESC
;


-- DO THE SAME FOR LEMON
SELECT 
	ai.ai_name, 
	aic.aic_name,
	COALESCE(SUM(CASE WHEN ds.v_id = 1 THEN ps.units ELSE 0 END), 0) AS units_sold_v1,
	COALESCE(SUM(CASE WHEN ds.v_id = 2 THEN ps.units ELSE 0 END), 0) AS units_sold_v2,
	COALESCE(SUM(ps.units), 0) AS total_units_sold
FROM product_name pn
	JOIN product_ingredients pi ON pn.id = pi.pn_id
	JOIN product_sold ps ON pn.id = ps.pn_id
	JOIN product_category pc ON pn.pc_id = pc.id
	JOIN product_base_flavor pbf ON pc.pbf_id = pbf.id
	JOIN date_sold ds ON ps.ds_id = ds.id 
	JOIN add_in ai ON pi.ai_id = ai.id 
	JOIN add_in_category aic ON ai.aic_id = aic.id
WHERE pbf.pbf_name = 'Lemon'
GROUP BY
	ai.ai_name, 
	aic.aic_name,
	pbf.pbf_name
ORDER BY 
	total_units_sold DESC
--	units_sold_v2 DESC
--	units_sold_v1 DESC
;

-- DO THE SAME FOR CHOCOLATE
SELECT 
	ai.ai_name, 
	aic.aic_name,
	COALESCE(SUM(CASE WHEN ds.v_id = 1 THEN ps.units ELSE 0 END), 0) AS units_sold_v1,
	COALESCE(SUM(CASE WHEN ds.v_id = 2 THEN ps.units ELSE 0 END), 0) AS units_sold_v2,
	COALESCE(SUM(ps.units), 0) AS total_units_sold
FROM product_name pn
	JOIN product_ingredients pi ON pn.id = pi.pn_id
	JOIN product_sold ps ON pn.id = ps.pn_id
	JOIN product_category pc ON pn.pc_id = pc.id
	JOIN product_base_flavor pbf ON pc.pbf_id = pbf.id
	JOIN date_sold ds ON ps.ds_id = ds.id 
	JOIN add_in ai ON pi.ai_id = ai.id 
	JOIN add_in_category aic ON ai.aic_id = aic.id
WHERE pbf.pbf_name = 'Chocolate'
GROUP BY
	ai.ai_name, 
	aic.aic_name,
	pbf.pbf_name
ORDER BY 
	total_units_sold DESC
--	units_sold_v2 DESC
--	units_sold_v1 DESC
;