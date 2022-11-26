SELECT * FROM classicmodels.products;
call new_procedure(1,2, @ggg);
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(in var_in_1 int, in var_in_2 int, out var_out int)
BEGIN
	SET var_out = var_in_1 + var_in_2;
END //
DELIMITER ;
select @ggg;