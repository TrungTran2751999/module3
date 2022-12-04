DELIMITER //
DROP procedure IF EXISTS new_procedure //
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
  declare i int;
  declare a int;
  declare quantity int;
  set quantity = (select count(vnewtable.stt) from vnewtable);
  
  create temporary table temp(
  stt_cur int,
  sotien_cur int,
  name_cur varchar(100),
  lichsu_cur int
  );
  
  set i=0;
  while(i <= quantity-1) do
	set @id = (select vnewtable.stt from vnewtable limit i,1);
    set @sotien = (select vnewtable.sotien from vnewtable limit i,1);
    set @name_cur = (select vnewtable.name from vnewtable limit i,1);
	if i = 0 then
        insert into temp(stt_cur, sotien_cur, name_cur, lichsu_cur) values (@id, @sotien, @name_cur, @sotien);
	else
        set @sotien_pres = (select vnewtable.sotien from vnewtable where vnewtable.stt = @id);
        set a = i-1;
        set @lichsu_prev = (select temp.lichsu_cur from temp limit a,1);
        insert into temp(stt_cur, sotien_cur, name_cur, lichsu_cur) values (@id, @sotien, @name_cur, @sotien_pres + @lichsu_prev);
	end if;
    set i = i+1;
   end while;
   select * from temp;
   drop table temp;
END //
DELIMITER ;
call new_procedure();

