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
select bomon.MABM, giaovien.HOTEN,max(giaovien.LUONG) from giaovien join bomon on giaovien.MABM = bomon.MABM
group by bomon.MABM;