ALTER TABLE `products` ADD INDEX index_productCode(productCode);
EXPLAIN SELECT productCode FROM `products` ;
ALTER TABLE `products` ADD INDEX indexComposite(productName, productPrice);
EXPLAIN SELECT * FROM `products` WHERE productName = 'May Giat' AND productPrice = 11000;

CREATE VIEW products_view AS SELECT productCode, productName, productPrice, productStatus FROM products;

SELECT * FROM products_view;
CREATE OR REPLACE VIEW products_view AS SELECT ProductStatus FROM `products`;
DROP VIEW products_view;
call getAllDataFromProduct();
call addNewProduct(7, 18, 'Quat May', 9000, 7, 'quat may chay ok', 1);
call updateProduct(2, 20, 'May tinh', 7000, 8, 'may tinh cau hinh cao', 0);
call deleteProduct(2)
