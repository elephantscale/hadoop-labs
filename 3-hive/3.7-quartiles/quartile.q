USE MY_NAME_db;

SELECT  explode(percentile_approx(amount,array(0.01,0.20,0.40,0.60,0.80))) 
    FROM transactions;

