-- INSERT INTO `quanlybanhang`.`customer` (`CustomerID`, `CustomerName`, `CustomerAge`) VALUES ('1', 'Minh Quan', '10');
-- INSERT INTO `quanlybanhang`.`customer` (`CustomerID`, `CustomerName`, `CustomerAge`) VALUES ('2', 'Ngoc Oanh', '20');
-- INSERT INTO `quanlybanhang`.`customer` (`CustomerID`, `CustomerName`, `CustomerAge`) VALUES ('3', 'Hong Ha', '50');

-- INSERT INTO `quanlybanhang`.`order`(`OrderID`, `CustomerID`, `OrderDate`, `OrderTotalPrice`) VALUES ('1', 1 , '2006-3-21', null);
-- INSERT INTO `quanlybanhang`.`order`(`OrderID`, `CustomerID`, `OrderDate`, `OrderTotalPrice`) VALUES ('2', 2 , '2006-3-23', null);
-- INSERT INTO `quanlybanhang`.`order`(`OrderID`, `CustomerID`, `OrderDate`, `OrderTotalPrice`) VALUES ('3', 1 , '2006-3-16', null);

-- INSERT INTO `quanlybanhang`.`product`(`ProductID`, `ProductName`, `ProductPrice`) VALUES ('1', 'May Giat', 3);
-- INSERT INTO `quanlybanhang`.`product`(`ProductID`, `ProductName`, `ProductPrice`) VALUES (2, 'Tu Lanh', 5);
-- INSERT INTO `quanlybanhang`.`product`(`ProductID`, `ProductName`, `ProductPrice`) VALUES (3, 'Dieu Hoa', 7);
-- INSERT INTO `quanlybanhang`.`product`(`ProductID`, `ProductName`, `ProductPrice`) VALUES (4, 'Quat', 1);
-- INSERT INTO `quanlybanhang`.`product`(`ProductID`, `ProductName`, `ProductPrice`) VALUES (5, 'Bep Dien', 2);

-- INSERT INTO `quanlybanhang`.`order_detail`(`OrderID`, `ProductID`, `OrderQuantity`) VALUES (1, 1, 3);
-- INSERT INTO `quanlybanhang`.`order_detail`(`OrderID`, `ProductID`, `OrderQuantity`) VALUES (1, 3, 7);
-- INSERT INTO `quanlybanhang`.`order_detail`(`OrderID`, `ProductID`, `OrderQuantity`) VALUES (2, 1, 1);
-- INSERT INTO `quanlybanhang`.`order_detail`(`OrderID`, `ProductID`, `OrderQuantity`) VALUES (3, 1, 8);
-- INSERT INTO `quanlybanhang`.`order_detail`(`OrderID`, `ProductID`, `OrderQuantity`) VALUES (2, 5, 4);
-- INSERT INTO `quanlybanhang`.`order_detail`(`OrderID`, `ProductID`, `OrderQuantity`) VALUES (2, 3, 3);

SELECT * FROM `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT C.CustomerID, C.CustomerName, P.ProductName FROM customer C join `order` O 
on C.CustomerID = O.CustomerID join order_detail OD on OD.OrderID = O.OrderID
join product P on OD.ProductID = P.ProductID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT C.CustomerID, C.CustomerName FROM customer C LEFT JOIN `order` O on C.CustomerID = O.CustomerID WHERE O.CustomerID IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
-- SET @dsds = (SELECT SUM(OD.OrderQuantity*P.ProductPrice) FROM `order` O join `order_detail` OD on O.OrderID = OD.OrderID
-- join `product` P on P.ProductID = OD.OrderID WHERE OD.OrderID = 3);
-- UPDATE `order` AS O SET O.OrderTotalPrice = @dsds WHERE O.OrderID = 3

-- SELECT SUM(OD.OrderQuantity*P.ProductPrice) FROM `order` O join `order_detail` OD on O.OrderID = OD.OrderID
-- join `product` P on P.ProductID = OD.OrderID WHERE OD.OrderID = 1

delimiter //
CREATE procedure quanlybanhang.while_example()
BEGIN
declare x INT;
declare sum INT;
SET x = 1;
WHILE(x <= (select count(O.OrderID) FROM `order` AS O)) DO
	SET sum = (SELECT SUM(OD.OrderQuantity*P.ProductPrice) FROM `order` O join `order_detail` OD on O.OrderID = OD.OrderID
	join `product` P on P.ProductID = OD.OrderID WHERE OD.OrderID = x);
    
    UPDATE `order` O SET O.OrderTotalPrice = sum WHERE O.OrderID = x; 
    SET x = x+1;
END WHILE;
END//

 


