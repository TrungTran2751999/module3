-- Q1. Cho biết họ tên và mức lương của các giáo viên nữ.
SELECT HOTEN, LUONG FROM giaovien WHERE PHAI = "Nữ";
-- Q2. Cho biết họ tên của các giáo viên và lương của họ sau khi tăng 10%.
-- CREATE VIEW GiaoVienView AS SELECT HOTEN, LUONG FROM giaovien WHERE LUONG IS NOT NULL WITH CHECK OPTION  ;
SELECT HOTEN, LUONG+LUONG*0.1 FROM giaovien;
-- Cho biết mã của các giáo viên có họ tên bắt đầu là “Nguyễn” và lương trên $2000 hoặc, giáo viên là trưởng bộ môn nhận chức sau năm 1995.
SELECT giaovien.MAGV FROM giaovien WHERE (substring_index(giaovien.HOTEN," ", 1) ="Nguyen");
SELECT giaovien.magv from giaovien join bomon on giaovien.magv = bomon.truongbm where year(ngaynhanchuc) >=1995;
-- --Cho biết tên những giáo viên khoa Công nghệ thông tin--.
select giaovien.HOTEN from giaovien join bomon on giaovien.mabm = bomon.mabm WHERE bomon.MAKHOA = "CNTT";
-- Cho biết thông tin của bộ môn cùng thông tin giảng viên làm trưởng bộ môn đó.
select giaovien.*, bomon.* from giaovien join bomon on giaovien.magv = bomon.truongbm;
-- Với mỗi giáo viên, hãy cho biết thông tin của bộ môn mà họ đang làm việc.
select giaovien.hoten,bomon.* from giaovien join bomon on giaovien.mabm = bomon.mabm;
-- Q7. Cho biết tên đề tài và giáo viên chủ nhiệm đề tài.
select detai.TENDT, giaovien.HOTEN from detai join giaovien on detai.gvcndt = giaovien.MAGV;
-- Q8. Với mỗi khoa cho biết thông tin trưởng khoa.
select giaovien.HOTEN as HoTenTruongKhoa, khoa.TENKHOA from giaovien join khoa on giaovien.MAGV = khoa.truongkhoa;
-- Q9. Cho biết các giáo viên của bộ môn “Vi sinh” có tham gia đề tài 006.
select distinct giaovien.HOTEN as GiaoVienViSinhThamGiaDetai006 from giaovien join bomon on giaovien.mabm = bomon.mabm
join thamgiadt on thamgiadt.magv = giaovien.magv join detai on detai.madt=thamgiadt.madt WHERE giaovien.MABM = "VS"
AND detai.madt = 006;
-- Q10. Với những đề tài thuộc cấp quản lý “Thành phố”, cho biết mã đề tài, đề tài thuộc về chủ đề nào, họ tên
-- người chủ nghiệm đề tài cùng với ngày sinh và địa chỉ của người ấy.
select detai.madt, chude.TENCD, giaovien.HOTEN, giaovien.NGSINH, giaovien.DIACHI 
from giaovien join detai on giaovien.MAGV = detai.GVCNDT join chude on detai.MACD = chude.MACD
where detai.CAPQL = "Trường";
-- Tìm họ tên của từng giáo viên và người phụ trách chuyên môn trực tiếp của giáo viên đó.
-- create view giaovienviewfilter as select giaovien.hoten, giaovien.magv from giaovien join giaovienview on giaovien.magv = giaovienview.gvqlcm;
select distinct giaovien.HOTEN, giaovien.GVQLCM, giaovienviewfilter.HOTEN from giaovien left join giaovienviewfilter
on giaovien.gvqlcm = giaovienviewfilter.magv;
-- Q12. Tìm họ tên của những giáo viên được “Nguyễn Thanh Tùng” phụ trách trực tiếp.
select distinct giaovien.HOTEN as giao_vien_duoc_Nguyen_An_Trung_huong_dan from giaovien left join giaovienviewfilter
on giaovien.gvqlcm = giaovienviewfilter.magv where giaovienviewfilter.hoten = "Nguyễn An Trung"; 
-- Q13. Cho biết tên giáo viên là trưởng bộ môn Hệ thống thông tin.
select giaovien.HOTEN from giaovien join bomon on giaovien.magv = bomon.TRUONGBM where bomon.mabm = "HTTT";
-- Q14. Cho biết tên người chủ nhiệm đề tài của những đề tài thuộc chủ đề Quản lý giáo dục.
select giaovien.hoten from giaovien join detai on giaovien.magv = detai.GVCNDT where detai.macd = "QLGD";
-- Q15. Cho biết tên các công việc của đề tài HTTT quản lý các trường ĐH có thời gian bắt đầu trong tháng
-- 3/2008.
select distinct congviec.TENCV from congviec join detai on congviec.madt = detai.madt where detai.macd = "QLGD";
-- Q17. Cho các công việc bắt đầu trong khoảng từ 01/01/2007 đến 01/08/2007.
select congviec.tencv from congviec where congviec.ngaybd between '2007-01-01' and '2007-08-01';
-- Q18. Cho biết họ tên các giáo viên cùng bộ môn với giáo viên “Trần Trà Hương”.
select giaovien.hoten from giaovien join bomon on giaovien.MABM = bomon.MABM 
where bomon.MABM = (select bomon.mabm from giaovien join bomon on giaovien.mabm = bomon.mabm 
where giaovien.hoten = "Trần Trà Hương") and giaovien.hoten != "Trần Trà Hương";
-- Q19. Tìm những giáo viên vừa là trưởng bộ môn vừa chủ nhiệm đề tài.
select distinct giaovien.hoten from giaovien join bomon on giaovien.magv = bomon.TRUONGBM
join detai on giaovien.magv = detai.gvcndt; 
-- Q20. Cho biết tên những giáo viên vừa là trưởng khoa và vừa là trưởng bộ môn.
select distinct giaovien.hoten from giaovien join bomon on giaovien.magv = bomon.TRUONGBM
join khoa on khoa.TRUONGKHOA = giaovien.MAGV;
-- Q21. Cho biết tên những trưởng bộ môn mà vừa chủ nhiệm đề tài
select distinct giaovien.hoten as truongBM_truongDetai from giaovien 
join bomon on giaovien.magv = bomon.TRUONGBM
join detai on detai.GVCNDT = giaovien.MAGV;
-- Q22. Cho biết mã số các trưởng khoa có chủ nhiệm đề tài.
select distinct giaovien.magv as magv_truongkhoa_CNDT from giaovien 
join khoa on giaovien.magv = khoa.TRUONGKHOA
join detai on detai.GVCNDT = giaovien.MAGV;
-- Q23. Cho biết mã số các giáo viên thuộc bộ môn HTTT hoặc có tham gia đề tài mã 001.
select distinct giaovien.magv as giaovien_CNTT_detai001 from giaovien left join thamgiadt on giaovien.magv = thamgiadt.MAGV 
where mabm = "HTTN" or thamgiadt.MADT = "001";
-- Q24. Cho biết giáo viên làm việc cùng bộ môn với giáo viên 002.
select giaovien.hoten as giaovien_cung_mabm_002 from giaovien 
where giaovien.MABM = (select giaovien.mabm from giaovien where giaovien.magv = "002");
-- Q25. Tìm những giáo viên là trưởng bộ môn.
select giaovien.hoten as truong_bm from giaovien join bomon where giaovien.magv = bomon.TRUONGBM;
-- Q26. Cho biết họ tên và mức lương của các giáo viên.
select giaovien.hoten, giaovien.LUONG from giaovien;
-- Q27. Cho biết số lượng giáo viên viên và tổng lương của họ.
select count(giaovien.magv) as quantity_giaovien, sum(giaovien.luong) as tongso_luong from giaovien;
-- Q28. Cho biết số lượng giáo viên và lương trung bình của từng bộ môn.
select count(giaovien.magv), giaovien.mabm, avg(giaovien.luong) from giaovien group by giaovien.mabm;
-- Q29. Cho biết tên chủ đề và số lượng đề tài thuộc về chủ đề đó.
select chude.tencd, count(detai.macd) from chude join detai on chude.macd = detai.macd group by chude.macd;
-- Q30. Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó tham gia.
select giaovien.HOTEN, count(thamgiadt.magv) from giaovien join thamgiadt
on giaovien.MAGV = thamgiadt.magv group by giaovien.HOTEN;
-- Q31. Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó làm chủ nhiệm.
select giaovien.hoten, count(detai.gvcndt) from giaovien 
join detai on giaovien.magv = detai.GVCNDT group by giaovien.hoten;
-- Q32. Với mỗi giáo viên cho tên giáo viên và số người thân của giáo viên đó.
select giaovien.hoten, count(nguoithan.magv) from giaovien
join nguoithan on giaovien.magv = nguoithan.magv group by giaovien.HOTEN;
-- Q33. Cho biết tên những giáo viên đã tham gia từ 3 đề tài trở lên.
select giaovien.hoten from giaovien join thamgiadt on giaovien.magv = thamgiadt.magv
group by giaovien.hoten
having count(thamgiadt.magv) >= 3;
-- Q34. Cho biết số lượng giáo viên đã tham gia vào đề tài Ứng dụng hóa học xanh
select count(giaovien.magv) from giaovien join thamgiadt on giaovien.magv = thamgiadt.magv
where thamgiadt.MADT = (select detai.madt from detai where detai.tendt = "Ứng dụng hóa học xanh");
-- Q35. Cho biết mức lương cao nhất của các giảng viên.
select max(giaovien.luong) from giaovien;
-- Q36. Cho biết những giáo viên có lương lớn nhất.
select giaovien.hoten from giaovien where giaovien.luong=(select max(giaovien.luong) from giaovien);
-- Q37. Cho biết lương cao nhất trong bộ môn “HTTT”.
select max(giaovien.luong) from giaovien where giaovien.mabm = "HTTT" ; 
-- Q38. Cho biết tên giáo viên lớn tuổi nhất của bộ môn Hệ thống thông tin.
select giaovien.hoten from giaovien 
where year(giaovien.ngsinh) =(select max(year(giaovien.NGSINH)) from giaovien where giaovien.mabm = "HTTT") ; 
-- Q39. Cho biết tên giáo viên nhỏ tuổi nhất khoa Công nghệ thông tin.
select giaovien.hoten from giaovien 
where year(giaovien.ngsinh) =(select min(year(giaovien.NGSINH)) from giaovien where giaovien.mabm = "HTTT") ; 
-- Q40. Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất.
select giaovien.hoten, bomon.MAKHOA from giaovien 
join bomon on giaovien.mabm=bomon.MABM join khoa on bomon.MAKHOA = khoa.MAKHOA
where giaovien.luong = (select min(giaovien.luong) from giaovien);
-- Q41. Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ.

select bomon.MABM, max(giaovien.LUONG) from giaovien join bomon on giaovien.MABM = bomon.MABM where giaovien.luong
group by bomon.MABM;

select distinct giaovien.MAGV, tb1.tenbm, giaovien.HOTEN, giaovien.LUONG, tb1.max from giaovien join 
(select bomon.MABM, bomon.TENBM, max(giaovien.LUONG) as max from giaovien join bomon on giaovien.MABM = bomon.MABM where giaovien.luong
group by bomon.MABM) as tb1 on giaovien.mabm = tb1.MABM
where giaovien.LUONG = tb1.max;


-- Q42. Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia.

select thamgiadt.MADT from thamgiadt where thamgiadt.MAGV = (select giaovien.MAGV from giaovien where giaovien.HOTEN = "Nguyễn Hoài An");
select detai.TENDT from detai where detai.MADT not in (
select thamgiadt.MADT from thamgiadt where thamgiadt.MAGV = (select giaovien.MAGV from giaovien where giaovien.HOTEN = "Nguyễn Hoài An")
);

-- Q43. Cho biết những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia. Xuất ra tên đề tài, tên người chủ nhiệm đề tài.

select detai.madt, detai.TENDT, giaovien.HOTEN from detai join giaovien on detai.GVCNDT = giaovien.MAGV join
(select distinct detai.TENDT as detai_gv_001_null from detai join thamgiadt on detai.MADT = thamgiadt.MADT 
where not detai.TENDT=(select distinct detai.TENDT from detai join thamgiadt on detai.MADT=thamgiadt.MADT
where thamgiadt.MAGV = (select giaovien.MAGV from giaovien where giaovien.HOTEN = "Nguyễn Hoài An")))as detai_gv_001_null
on detai.TENDT = detai_gv_001_null.detai_gv_001_null;

-- Q44. Cho biết tên những giáo viên khoa Công nghệ thông tin mà chưa tham gia đề tài nào.

select gvcntt.hoten from (select giaovien.HOTEN, giaovien.MAGV from giaovien join bomon on giaovien.MABM = bomon.MABM 
join khoa on khoa.MAKHOA = bomon.MAKHOA where bomon.MAKHOA = "CNTT") as gvcntt left join thamgiadt
on gvcntt.magv = thamgiadt.magv where thamgiadt.MAGV is null;

-- Q45. Tìm những giáo viên không tham gia bất kỳ đề tài nào
select giaovien.HOTEN from giaovien left join thamgiadt on giaovien.magv = thamgiadt.magv where thamgiadt.MAGV is null;
-- Q46. Cho biết giáo viên có lương lớn hơn lương của giáo viên “Nguyễn Hoài An”
select giaovien.HOTEN, giaovien.luong from giaovien
where giaovien.luong > (select giaovien.luong from giaovien where giaovien.HOTEN = "Nguyễn Hoài An");
-- Q47. Tìm những trưởng bộ môn tham gia tối thiểu 1 đề tài
select truongbm.ma_truong_bm from
(select giaovien.HOTEN, giaovien.magv as ma_truong_bm from giaovien join bomon on giaovien.MAGV = bomon.TRUONGBM) as truongbm
join
(select thamgiadt.magv, count(thamgiadt.MADT) as quantity_madt from thamgiadt group by thamgiadt.magv) as gv_thamgiadt
on truongbm.ma_truong_bm = gv_thamgiadt.magv 
where gv_thamgiadt.quantity_madt >= 1;
-- Q48. Tìm giáo viên trùng tên và cùng giới tính với giáo viên khác trong cùng bộ môn

select distinct giaovien.hoten, giaovien.PHAI from giaovien join
(select * from giaovien) as giaoviencurent 
on giaovien.HOTEN = giaoviencurent.HOTEN and giaovien.PHAI = giaoviencurent.PHAI
and not giaovien.magv = giaoviencurent.magv and giaovien.MABM = giaoviencurent.mabm;

-- Q49. Tìm những giáo viên có lương lớn hơn lương của ít nhất một giáo viên bộ môn “Công nghệ phần mềm”
-- select giaovien.hoten, giaovien.luong from giaovien where giaovien.MABM = (select mabm from bomon where bomon.tenbm="Hệ thống thông tin");
select giaovien.hoten, giaovien.LUONG from giaovien join 
(select giaovien.hoten, giaovien.luong from giaovien where giaovien.MABM = 
(select mabm from bomon where bomon.tenbm="Hệ thống thông tin")) as giaovien_cntt 
on giaovien.LUONG > giaovien_cntt.LUONG;
-- Q50. Tìm những giáo viên có lương lớn hơn lương của tất cả giáo viên thuộc bộ môn “Hệ thống thông tin”
select giaovien.hoten from giaovien where giaovien.LUONG > (select max(giaovien.luong) from giaovien where giaovien.MABM = 
(select mabm from bomon where bomon.tenbm="Hệ thống thông tin"));
-- Q51. Cho biết tên khoa có đông giáo viên nhất
select giaovien.*, bomon.TENBM, khoa.MAKHOA, khoa.TENKHOA from giaovien join bomon on giaovien.mabm = bomon.mabm
join khoa on khoa.MAKHOA = bomon.MAKHOA;

select giaovien_khoa.tenkhoa, count(giaovien_khoa.makhoa) as quantity_khoa from  (select giaovien.*, bomon.TENBM, khoa.MAKHOA, khoa.TENKHOA from giaovien join bomon on giaovien.mabm = bomon.mabm
join khoa on khoa.MAKHOA = bomon.MAKHOA) as giaovien_khoa group by giaovien_khoa.tenkhoa order by quantity_khoa desc limit 1;

-- Q52. Cho biết họ tên giáo viên chủ nhiệm nhiều đề tài nhất
select detai.gvcndt, count(detai.GVCNDT) as quantity_detai from detai group by detai.GVCNDT;

select max(manage_detai.quantity_detai) from (select detai.gvcndt, count(detai.GVCNDT) 
as quantity_detai from detai group by detai.GVCNDT) as manage_detai;

select gvcndt_tbl.detai_gvcndt from 
(select detai.gvcndt as detai_gvcndt, count(detai.GVCNDT) as quantity_detai from detai group by detai.GVCNDT) as gvcndt_tbl
where gvcndt_tbl.quantity_detai = 
(select max(manage_detai.quantity_detai) from (select detai.gvcndt, count(detai.GVCNDT) 
as quantity_detai from detai group by detai.GVCNDT) as manage_detai); 

select giaovien.hoten from giaovien join (select gvcndt_tbl.detai_gvcndt from 
(select detai.gvcndt as detai_gvcndt, count(detai.GVCNDT) as quantity_detai from detai group by detai.GVCNDT) as gvcndt_tbl
where gvcndt_tbl.quantity_detai = 
(select max(manage_detai.quantity_detai) from (select detai.gvcndt, count(detai.GVCNDT) 
as quantity_detai from detai group by detai.GVCNDT) as manage_detai)) as detai_gvcndt_tbl
on giaovien.MAGV = detai_gvcndt_tbl.detai_gvcndt;
-- Q53. Cho biết mã bộ môn có nhiều giáo viên nhất
select giaovien.MABM, count(giaovien.MABM) as quantity from giaovien group by giaovien.MABM;
select max(gv_bm.quantity) from 
(select giaovien.MABM, count(giaovien.MABM) as quantity from giaovien group by giaovien.MABM) as gv_bm;
select gv_mabm.mabm from 
(select giaovien.MABM, count(giaovien.MABM) as quantity from giaovien group by giaovien.MABM) as gv_mabm
where gv_mabm.quantity = (select max(gv_bm.quantity) from 
(select giaovien.MABM, count(giaovien.MABM) as quantity from giaovien group by giaovien.MABM) as gv_bm);

-- Q54. Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất.
select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV;
select max(thamgiadt_gv.quantity) from (select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV) as thamgiadt_gv;
select thamgiadt_gv_tbl.MAGV from (select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV) as thamgiadt_gv_tbl
where thamgiadt_gv_tbl.quantity = (select max(thamgiadt_gv.quantity) from (select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV) as thamgiadt_gv);

select giaovien.hoten from giaovien where giaovien.MAGV = (select thamgiadt_gv_tbl.MAGV from (select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV) as thamgiadt_gv_tbl
where thamgiadt_gv_tbl.quantity = (select max(thamgiadt_gv.quantity) from (select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV) as thamgiadt_gv));

-- Q55. Cho biết tên giáo viên tham gia nhiều đề tài nhất của bộ môn HTTT.
select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV;
select giaovien.MAGV, giaovien.hoten from giaovien where giaovien.MABM = "HTTT";

set @max_thamgiadt = (select max(thamgiadt_gv_main.quantity) from (select thamgiadt_gv.magv, quantity_thamgiadt.hoten, thamgiadt_gv.quantity from
(select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV) as thamgiadt_gv
join
(select giaovien.MAGV, giaovien.hoten from giaovien where giaovien.MABM = "HTTT") as quantity_thamgiadt
on quantity_thamgiadt.magv = thamgiadt_gv.magv) as thamgiadt_gv_main having max(thamgiadt_gv_main.quantity));
select main_thamgiadt.hoten from (select thamgiadt_gv.magv, quantity_thamgiadt.hoten, thamgiadt_gv.quantity from
(select thamgiadt.MAGV, count(thamgiadt.MAGV) as quantity from thamgiadt group by thamgiadt.MAGV) as thamgiadt_gv
join
(select giaovien.MAGV, giaovien.hoten from giaovien where giaovien.MABM = "HTTT") as quantity_thamgiadt
on quantity_thamgiadt.magv = thamgiadt_gv.magv) as main_thamgiadt where main_thamgiadt.quantity = @max_thamgiadt;

-- Q56. Cho biết tên giáo viên và tên bộ môn của giáo viên có nhiều người thân nhất.
select nguoithan.magv, count(nguoithan.magv) from nguoithan group by nguoithan.magv;
select tbl_nguoithan_quantity.magv from (select nguoithan.magv, count(nguoithan.magv) as quantity from nguoithan group by nguoithan.magv) as tbl_nguoithan_quantity
where tbl_nguoithan_quantity.quantity = @max;

set @max = (select max(tbl_nguoithan_quantity.quantity) from 
(select nguoithan.magv, count(nguoithan.magv) as quantity from nguoithan group by nguoithan.magv) as tbl_nguoithan_quantity);

select distinct giaovien.hoten, giaovien.mabm, giaovien.magv from giaovien join 
(select nguoithan.magv, count(nguoithan.magv) from nguoithan group by nguoithan.magv) as tbl_nguoithan_quantity
right join
(select tbl_nguoithan_quantity.magv from (select nguoithan.magv, count(nguoithan.magv) as quantity from nguoithan group by nguoithan.magv) as tbl_nguoithan_quantity
where tbl_nguoithan_quantity.quantity = @max) as tbl_nguoithan_quantity_main
on giaovien.magv = tbl_nguoithan_quantity_main.magv;

-- Q57. Cho biết tên trưởng bộ môn mà chủ nhiệm nhiều đề tài nhất.

select detai.GVCNDT, count(detai.GVCNDT), giaovien.hoten as hoten from 
detai join giaovien on detai.GVCNDT = giaovien.MAGV 
group by detai.GVCNDT 
having count(detai.GVCNDT) >= all(select count(detai.GVCNDT) as quantity from detai group by detai.GVCNDT);

-- Q58. Cho biết tên giáo viên nào mà tham gia đề tài đủ tất cả các chủ đề.

select thamgiadt.magv, giaovien.hoten from 
thamgiadt join giaovien on thamgiadt.magv = giaovien.MAGV
where thamgiadt.MADT = ALL(select thamgiadt.MADT from thamgiadt);

-- Q59. Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn HTTT tham gia.
 
 select distinct detai.TENDT from 
 thamgiadt join detai on thamgiadt.MAdt = detai.madt 
 where thamgiadt.MAGV = 
 ALL(select thamgiadt.MAGV from thamgiadt join giaovien on thamgiadt.MAGV = giaovien.MAGV where giaovien.MABM = "HTTT");
 
--  Q61. Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là QLGD.

select detai.MADT, chude.MACD from detai join chude on detai.MACD = chude.MACD;
select thamgiadt.MADT, giaovien.hoten from giaovien join thamgiadt on giaovien.magv = thamgiadt.magv;
select distinct tb2.hoten from 
(select detai.MADT, chude.MACD from detai join chude on detai.MACD = chude.MACD) as tb1 join
(select thamgiadt.MADT, giaovien.hoten from giaovien join thamgiadt on giaovien.magv = thamgiadt.magv) as tb2
on tb1.MADT = tb2.madt where tb1.macd = "QLGD";

-- Q62. Cho biết tên giáo viên nào tham gia tất cả các đề tài mà giáo viên Trần Trà Hương đã tham gia.

select distinct giaovien.hoten from 
giaovien join thamgiadt on giaovien.MAGV = thamgiadt.MAGV
where thamgiadt.MADT = 
ALL(select thamgiadt.MADT from giaovien join thamgiadt on thamgiadt.MAGV = giaovien.MAGV 
where giaovien.HOTEN = "Trần Trà Hương") and giaovien.hoten != "Trần Trà Hương";

-- Q63. Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn Hóa Hữu Cơ tham gia.

select thamgiadt.MADT, giaovien.MAGV from giaovien 
join thamgiadt on giaovien.MAGV = thamgiadt.MAGV
where thamgiadt.MAGV = all(select giaovien.MAGV from giaovien where giaovien.MABM = "HTTT");

-- Q64. Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài 006.

select thamgiadt.MaGV, thamgiadt.STT, giaovien.hoten from thamgiadt join giaovien on thamgiadt.MAGV = giaovien.MAGV where thamgiadt.MADT = "006";
select count(congviec.madt) from congviec where congviec.MADT = "006";

select tb1.magv, tb1.hoten from (select thamgiadt.MaGV, thamgiadt.STT, giaovien.hoten from 
thamgiadt join giaovien on thamgiadt.MAGV = giaovien.MAGV where thamgiadt.MADT = "006")
as tb1 group by tb1.magv having count(tb1.magv) = (select count(congviec.madt) from congviec where congviec.MADT = "006");

-- Q65. Cho biết giáo viên nào đã tham gia tất cả các đề tài của chủ đề Ứng dụng công nghệ.
set @detai = (select detai.MADT from detai where detai.MACD = (select chude.MACD from chude where chude.TENCD = "Ứng dụng công nghệ"));
select @detai;

select tb1.magv, tb1.hoten from (select thamgiadt.MaGV, thamgiadt.STT, giaovien.hoten from 
thamgiadt join giaovien on thamgiadt.MAGV = giaovien.MAGV where thamgiadt.MADT in 
(select detai.MADT from detai where detai.MACD = (select chude.MACD from chude where chude.TENCD = "Ứng dụng công nghệ"))) as tb1
group by tb1.magv having count(tb1.magv) = (select count(congviec.madt) from congviec where congviec.MADT in 
(select detai.MADT from detai where detai.MACD = (select chude.MACD from chude where chude.TENCD = "Ứng dụng công nghệ")));

-- Q66. Cho biết tên giáo viên nào đã tham gia tất cả các đề tài của do Trần Trà Hương làm chủ nhiệm.

select detai.MADT from detai where detai.GVCNDT = (select giaovien.MAGV from giaovien where giaovien.hoten = "Trần Trà Hương");
select thamgiadt.MADT, thamgiadt.MAGV from thamgiadt where thamgiadt.MADT in
(select detai.MADT from detai where detai.GVCNDT = (select giaovien.MAGV from giaovien where giaovien.hoten = "Trần Trà Hương"));

set @magv = (select tb3.magv from (select tb2.magv, count(tb2.magv) as quantity from (select distinct tb1.magv, tb1.madt from (select thamgiadt.MADT, thamgiadt.MAGV from thamgiadt where thamgiadt.MADT in
(select detai.MADT from detai where detai.GVCNDT = (select giaovien.MAGV from giaovien where giaovien.hoten = "Trần Trà Hương")))
as tb1) as tb2 group by tb2.magv) as tb3
where tb3.quantity > 1);
select @magv;
select giaovien.hoten from giaovien where giaovien.MAGV = @magv;

-- Q67. Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa CNTT tham gia.
select distinct thamgiadt.madt, thamgiadt.magv from thamgiadt 
join giaovien on thamgiadt.MAGV = giaovien.MAGV 
join bomon on giaovien.mabm = bomon.MABM
join khoa on khoa.MAKHOA = bomon.MAKHOA
where khoa.MAKHOA = "CNTT";

set @count = (select count(giaovien.magv) from 
giaovien join bomon on giaovien.MABM = bomon.MABM join
khoa on khoa.MAKHOA = bomon.MAKHOA where bomon.MAKHOA = "CNTT");

select tb1.madt from (select distinct thamgiadt.madt, thamgiadt.magv from thamgiadt 
join giaovien on thamgiadt.MAGV = giaovien.MAGV 
join bomon on giaovien.mabm = bomon.MABM
join khoa on khoa.MAKHOA = bomon.MAKHOA
where khoa.MAKHOA = "CNTT") as tb1 group by tb1.madt having count(tb1.MADT) = @count;

-- Q68. Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài Nghiên cứu tế bào gốc.

set @detai = (select detai.MADT from detai where detai.TENDT = "Nghiên cứu tế bào gốc");
select @detai;

select tb1.magv, tb1.hoten from (select thamgiadt.MaGV, thamgiadt.STT, giaovien.hoten from 
thamgiadt join giaovien on thamgiadt.MAGV = giaovien.MAGV where thamgiadt.MADT = @detai) as tb1
group by tb1.magv having count(tb1.magv) = (select count(congviec.madt) from congviec where congviec.MADT = @detai);

-- Q69. Tìm tên các giáo viên được phân công làm tất cả các đề tài có kinh phí trên 100 triệu?

select distinct giaovien.HOTEN from giaovien join thamgiadt on giaovien.MAGV = thamgiadt.MAGV join
detai on thamgiadt.MADT = detai.MADT where detai.KINHPHI > 100;

-- Q70. Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa Sinh Học tham gia.

set @count = (select count(giaovien.magv) from 
giaovien join bomon on giaovien.MABM = bomon.MABM join
khoa on khoa.MAKHOA = bomon.MAKHOA where bomon.MAKHOA = "SH");

select tb1.madt, tb1.TENDT from (select distinct thamgiadt.madt, thamgiadt.magv, detai.TENDT from thamgiadt 
join giaovien on thamgiadt.MAGV = giaovien.MAGV 
join bomon on giaovien.mabm = bomon.MABM
join khoa on khoa.MAKHOA = bomon.MAKHOA
join detai on detai.MADT = thamgiadt.MADT
where khoa.MAKHOA = "SH") as tb1 group by tb1.madt having count(tb1.MADT) = @count;

-- Q71. Cho biết mã số, họ tên, ngày sinh của giáo viên tham gia tất cả các công việc của đề tài “Ứng dụng hóa học xanh”.

set @detai = (select detai.MADT from detai where detai.TENDT = "Ứng dụng hóa học xanh");
select @detai;

select tb1.magv, tb1.hoten, tb1.NGSINH from (select thamgiadt.MaGV, thamgiadt.STT, giaovien.hoten, giaovien.NGSINH from 
thamgiadt join giaovien on thamgiadt.MAGV = giaovien.MAGV where thamgiadt.MADT = @detai) as tb1
group by tb1.magv having count(tb1.magv) = (select count(congviec.madt) from congviec where congviec.MADT = @detai);

-- Q72. Cho biết mã số, họ tên, tên bộ môn và tên người quản lý chuyên môn của giáo viên tham gia tất cả các đề
-- tài thuộc chủ đề “Nghiên cứu phát triển”.

select distinct giaovien.MAGV, detai.MADT from detai join thamgiadt on detai.MADT = thamgiadt.MADT join
giaovien on giaovien.MAGV = thamgiadt.MAGV
where detai.MACD = (select chude.MACD from chude where chude.TENCD = "Nghiên cứu phát triển");

set @var = (select count(detai.madt) from detai join chude on detai.MACD = chude.MACD where chude.TENCD = "Nghiên cứu phát triển");
select tb1.magv, tb1.hoten, tb1.ngsinh, tb1.tenkhoa, tb1.truongkhoa, count(tb1.magv) from (
select distinct giaovien.MAGV, giaovien.hoten, giaovien.NGSINH, khoa.TENKHOA, khoa.TRUONGKHOA, detai.MADT
from detai join thamgiadt on detai.MADT = thamgiadt.MADT join
giaovien on giaovien.MAGV = thamgiadt.MAGV 
join bomon on bomon.MAbm = giaovien.MABM join
khoa on khoa.MAKHOA = bomon.MAKHOA
where detai.MACD = (select chude.MACD from chude where chude.TENCD = "Nghiên cứu phát triển")) 
as tb1 group by tb1.magv having count(tb1.magv) = @var;

-- Q73. Cho biết họ tên, ngày sinh, tên khoa, tên trưởng khoa của giáo viên tham gia tất cả các đề tài có giáo viên “Nguyễn Hoài An” tham gia.

select thamgiadt.madt, thamgiadt.MAGV from thamgiadt join giaovien on thamgiadt.magv = giaovien.MAGV where giaovien.HOTEN = "Nguyễn Hoài An";

select distinct thamgiadt.magv, thamgiadt.madt from thamgiadt join (
select distinct thamgiadt.madt from thamgiadt join giaovien on thamgiadt.magv = giaovien.MAGV where giaovien.HOTEN = "Nguyễn Hoài An") as tb1
on tb1.MADT = thamgiadt.MADT;

set @var = (select count(tb1.MADT) from 
(select thamgiadt.madt, thamgiadt.MAGV from thamgiadt join giaovien on thamgiadt.magv = giaovien.MAGV where giaovien.HOTEN = "Nguyễn Hoài An") 
as tb1);

select tb2.magv, count(tb2.magv) from (select distinct thamgiadt.magv, thamgiadt.madt from thamgiadt join (
select distinct thamgiadt.madt from thamgiadt join giaovien on thamgiadt.magv = giaovien.MAGV where giaovien.HOTEN = "Nguyễn Hoài An") as tb1
on tb1.MADT = thamgiadt.MADT)
as tb2 
group by tb2.MAGV having count(tb2.magv) = @var;

-- Q75. Cho biết họ tên giáo viên và tên bộ môn họ làm trưởng bộ môn nếu có
-- Q76. Cho danh sách tên bộ môn và họ tên trưởng bộ môn đó nếu có
select bomon.TRUONGBM, bomon.TENBM, giaovien.HOTEN from bomon left join giaovien on bomon.TRUONGBM = giaovien.MAGV;
-- Q77. Cho danh sách tên giáo viên và các đề tài giáo viên đó chủ nhiệm nếu có
select detai.GVCNDT, detai.MADT, giaovien.HOTEN from giaovien left join detai on giaovien.MAGV = detai.GVCNDT;
-- Q79. Xuất ra thông tin của giáo viên (MAGV, HOTEN) và mức lương của giáo viên. Mức lương được xếp theo,
-- quy tắc: Lương của giáo viên < $1800 : “THẤP” ; Từ $1800 đến $2200: TRUNG BÌNH; Lương > $2200:“CAO”
select giaovien.luong from giaovien;
create temporary table luong_tam(
	magv varchar (45),
    hoten varchar(45),
    luong double,
    hang varchar(45)
    );
select * from luong_tam;
select giaovien.magv from giaovien where giaovien.magv = "00" + "1";
-- 	create temporary table luong_tam_2(
-- 	magv varchar (45),
--     hoten varchar(45),
--     luong int,
--     hang varchar(45)
--     );
call xuat_hang_luong_giaovien_2();
-- ---------------------------------------------------------------------------------------------
call spDeleteKhoaByid();

















