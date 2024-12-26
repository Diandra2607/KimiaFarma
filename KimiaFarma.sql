CREATE OR REPLACE TABLE `fabled-sector-443707-g4.Kimia_Farma.KimiaFarma` AS
SELECT
    the_transaction.* except(rating),
    the_transaction.rating as rating_transaksi,
    the_inventory.* EXCEPT(branch_id, product_id)
FROM
    `fabled-sector-443707-g4.Kimia_Farma.kf_final_transaction` AS the_transaction
INNER JOIN
    `fabled-sector-443707-g4.Kimia_Farma.kf_inventory` AS the_inventory
USING (branch_id, product_id);

CREATE OR REPLACE TABLE `fabled-sector-443707-g4.Kimia_Farma.KimiaFarma2` AS
SELECT
    the_original.*,
    the_office.rating AS rating_cabang, 
    the_office.* EXCEPT(branch_id, rating) 
FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarma` AS the_original
INNER JOIN
    `fabled-sector-443707-g4.Kimia_Farma.kf_kantor_cabang` AS the_office
ON the_original.branch_id = the_office.branch_id; 

CREATE OR REPLACE TABLE `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal` AS
SELECT
    the_original2.*,
    the_product.* EXCEPT(product_id,product_name,price)
FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarma2` AS the_original2
INNER JOIN
    `fabled-sector-443707-g4.Kimia_Farma.kf_product` AS the_product
USING (product_id,product_name,price);

Select * from `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`;

SELECT
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  price AS actual_price,
  discount_percentage,
  price * (1 - discount_percentage) AS nett_sales,
  CASE
    WHEN price <= 50000 THEN 0.1 * (price * (1 - discount_percentage))
    WHEN price > 50000 AND price <= 100000 THEN 0.15 * (price * (1 - discount_percentage))
    WHEN price > 100000 AND price <= 300000 THEN 0.2 * (price * (1 - discount_percentage))
    WHEN price > 300000 AND price <= 500000 THEN 0.25 * (price * (1 - discount_percentage))
    WHEN price > 500000 THEN 0.3 * (price * (1 - discount_percentage))
  END AS nett_profit,
  rating_transaksi
FROM `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`;

Select  
distinct branch_name,
provinsi,
rating_cabang,  
rating_transaksi 
from `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`
order by rating_cabang desc, rating_transaksi asc
limit 5;

WITH SalesData AS (
    SELECT
       provinsi,
        price * (1 - discount_percentage) AS nett_sales
    FROM
        `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`
)
SELECT * FROM SalesData
order by SalesData.nett_sales desc
limit 10;

SELECT
   distinct
    provinsi,
    COUNT(transaction_id) AS total_transaksi
FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`
GROUP BY
  provinsi
ORDER BY
    total_transaksi DESC
LIMIT 10;

SELECT
    EXTRACT(YEAR FROM date) AS tahun,
    SUM(price * (1 - discount_percentage)) AS total_pendapatan
FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`
GROUP BY
    tahun
ORDER BY
    tahun;

    with Provinsi_Profit as 
    (select 
    provinsi, 
    product_id,
     CASE
    WHEN price <= 50000 THEN 0.1 * (price * (1 - discount_percentage))
    WHEN price > 50000 AND price <= 100000 THEN 0.15 * (price * (1 - discount_percentage))
    WHEN price > 100000 AND price <= 300000 THEN 0.2 * (price * (1 - discount_percentage))
    WHEN price > 300000 AND price <= 500000 THEN 0.25 * (price * (1 - discount_percentage))
    WHEN price > 500000 THEN 0.3 * (price * (1 - discount_percentage))
  END AS nett_profit
  FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`)
    Select provinsi, 
    sum(nett_profit) as total_profit,
    count(product_id) as total_product_terjual
     from Provinsi_Profit
     group by provinsi
     order by total_profit desc, total_product_terjual desc;

    SELECT
    product_category,
    AVG(price) AS rata_rata_harga
FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`
GROUP BY
    product_category;


    SELECT
    EXTRACT(YEAR FROM date) AS tahun,
    AVG(price * (1 - discount_percentage)) AS rata_rata_nilai_transaksi
FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`
GROUP BY
    tahun
ORDER BY tahun;

SELECT
    product_category,
    COUNT(*) AS jumlah_transaksi
FROM
    `fabled-sector-443707-g4.Kimia_Farma.KimiaFarmaFinal`
GROUP BY
    product_category;