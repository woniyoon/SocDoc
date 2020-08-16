drshow user;

select*
from tabs;

select*
from hospitalinfo;

select s.day, s.open, t.hour as close
from
    (select s.day, s.close, t.hour as open
    from scheduleEdit s left join
         timetable t
         on s.open = t.hourSeq
    )s
join timetable t
on s.close = t.hourSeq;


select hpseq, hpname, address, phone, dept
from 
(
    select rownum AS rno
         , hpseq, hpname, address, phone, dept
    from
    (
        select hpseq, hpname, address, phone, dept 
        from hospitalinfo
        where 1 = 1
        and address like '%'|| '서울' ||'%'
        and hpname like '%'|| '성광' ||'%'
    ) V
) T
where rno between 1 and 10;





select hpseq, hpname, address, phone, dept
		from 
		(
		    select rownum AS rno
		         , hpseq, hpname, address, phone, dept
		    from
		    (
		        select hpseq, hpname, address, phone, dept 
		        from hospitalinfo
		        where 1 = 1
		     		and address like '%'|| '' ||'%'
		     		and address like '%'|| '' ||'%'
		     		and address like '%'|| '' ||'%'				
		     		and dept like '%'|| '' ||'%'				
		     		and hpname like '%'|| '' ||'%'				
		    ) V
		) T
		where rno between 11 and 20;







INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude, mainImg) 
VALUES ('서울특별시 강남구 테헤란로 513 (삼성동, 테헤란로81길10,B1일부,삼성로92길29,3,4)','(의)미래의료재단리드림의원','02-540-0001',2,'내과병원입니다.','내과',37.508024781100005,127.05888980410002, 'slide1.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 중구 한강대로 416, 2층 (남대문로5가, 서울스퀘어)','(의)성광의료재단차여성의원','02-2002-0300',3,'내과병원입니다.','내과',37.5555048939659,126.97375281464887, 'slide2.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude, mainImg) VALUES ('서울특별시 강남구 도산대로 442 (청담동, 2층일부 3층일부)','(의)성광의료재단차움의원','02-3015-5300',4,'내과병원입니다.','내과',37.523433142708896,127.04370783516794, 'slide3.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude, mainImg) VALUES ('서울특별시 강남구 영동대로 211, 3층 (대치동, 영광빌딩)','(의)열린의료재단강남열린의원','02-3454-0601',5,'내과병원입니다.','내과',37.49756774914356,127.0688195834955, 'slide1.jpg');


INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 강동구 천호대로 1092, 1층 112호,113호 (성내동, SK허브진)','(의)열린의료재단강동열린의원','02-485-7575',6,'3대째 내려온 약손!','소아청소년과',37.53435601627652,127.13619958327628,'slide2.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 강북구 도봉로 213 (미아동)','(의)열린의료재단경의원','02-945-2305',7,'최고의 병원, 추천합니다!','소아청소년과',37.62760249650932,127.02526203615491,'slide2.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 종로구 종로 335, 7층 (창신동)','(의)열린의료재단동대문열린의원','02-924-0875',8,'3대째 내려온 약손!','소아청소년과',37.57310514002614,127.01482468170391,'slide2.jpg');

INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 관악구 시흥대로 554 (신림동)','가람신경정신과의원','02-859-8500',9,'3대째 내려온 약손!','정신건강의학과',37.48242099565355,126.90156557654394,'slide3.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 성동구 왕십리로 410, L동 3층 320호 (하왕십리동, 센트라스)','365연세의원','02-2291-2211',10,'365일 열려있습니다.','정신건강의학과',37.5665912196,127.0240823503,'slide3.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 서대문구 신촌로35길 10, 212호 (북아현동, e편한세상신촌 4단지)','고려힐링정신건강의학과의원','02-6354-8275',11,'정성을 다해 치료해드립니다.','정신건강의학과',37.558642281819516,126.95597368482214,'slide3.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 용산구 이태원로 211, (한남동)','국제의원','02-6354-8275',12,'외국인 진료가능','정신건강의학과',37.534986622,126.9972755302,'slide3.jpg');

INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 강남구 강남대로 478, 5층 (논현동, 제우빌딩)','강남뷰티의원','02-562-8000',13,'365일 열려있습니다.','피부과',37.5051068161,127.0246687881,'slide1.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 노원구 노해로 491 (상계동)','JK의원','02-6354-8275',14,'최고의 피부과','피부과',37.6550253516,127.0626366165,'slide1.jpg');
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude,mainImg) VALUES ('서울특별시 구로구 도림로 90, 혜성빌딩 5층 (구로동)','S아이니의원','02-858-8811',15,'구로구 최고의 피부과!','피부과',37.4903785244,126.8934289824,'slide1.jpg');

commit;

INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude) VALUES ('서울특별시 은평구 통일로 721 (대조동)','강창원내과의원','02-389-2043',16,'여성의료진이 있어요!','여성의학과',37.6099935190632,126.92994894857003);
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude) VALUES ('서울특별시 광진구 아차산로 219, 3층 301호 (화양동, 삼영빌딩)','건대와이(Y)산부인과의원','02-461-8120',17,'건대 근처 최고의 산부인과','여성의학과',37.541126352135365,127.06793175591599);


INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude) VALUES ('서울특별시 마포구 만리재로 14, 3층 (공덕동, 르네상스타워빌딩)','공덕서울안과의원','02-704-3088',18,'신이 내린 안과의사','안과',37.5439944436,126.9528365624);
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude) VALUES ('서울특별시 종로구 종로 22, 인주빌딩 4층 (서린동)','공안과의원','02-733-5111',19,'눈닥터가 화끈하게 모십니다.','안과',37.56987515441535,126.97967467253976);

INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude) VALUES ('서울특별시 관악구 은천로 105 (봉천동)','DR.문이비인후과의원','02-873-8575',20,'닥터가 기다리고 있어요','이비인후과',37.487124281693745,126.94713289496008);
INSERT INTO hospitalInfo(address,hpName,phone,hpSeq,info,dept,latitude,longitude) VALUES ('서울특별시 강북구 삼양로 424 (수유동)','강북서울이비인후과의원','02-996-0029',21,'최.고.의.이.비.인.후.과.','이비인후과',37.64144264314901,127.01714001517318);
    

select r.userid, r.content, v.avg
from (select hpseq, avg(rating) as avg from hospitalreview group by hpseq having hpseq=2) v join hospitalreview r
on v.hpseq = r.hpseq;


select*
from hospitalinfo;



select count(*)
		from hospitalinfo	
		where 1=1
		    and address like '%'||''||'%'
     		and address like '%'||'도산'||'%'
     		and address like '%'||''||'%'				
     		and dept like '%'||''||'%'				
     		and hpname like '%'||''||'%';		
            
            
            
            
--            
--          
--CREATE OR REPLACE FUNCTION RADIANS(nDegrees IN NUMBER) 
--RETURN NUMBER DETERMINISTIC 
--IS
--BEGIN
--  /*
--  -- radians = degrees / (180 / pi)
--  -- RETURN nDegrees / (180 / ACOS(-1)); but 180/pi is a constant, so...
--  */
--  RETURN nDegrees / 57.29577951308232087679815481410517033235;
--END RADIANS;
--
---- 
--create or replace function DISTNACE_WGS84( H_LAT in NUMBER, H_LNG in NUMBER, T_LAT in NUMBER, T_LNG in NUMBER)
--return number deterministic
--is
--begin
--  return ( 6371.0 * acos(  
--          cos( radians( H_LAT ) )*cos( radians( T_LAT  ) )
--          *cos( radians( T_LNG  )-radians( H_LNG ) )
--          +
--          sin( radians( H_LAT ) )*sin( radians( T_LAT  ) )        
--         ));
--end DISTNACE_WGS84;
--
--
--drop function DISTNACE_WGS84;

select DISTNACE_WGS84(37.53435601627652, 127.13619958327628, 37.55796921118739, 37.55796921118739) from hospitalInfo;

desc hospitalinfo;

select DISTNACE_WGS84(37.53435601627652, 127.13619958327628, latitude, longitude)
from hospitalinfo where latitude != 37.53435601627652 and longitude != 127.13619958327628; 

select * from hospitalinfo where latitude != 37.53435601627652 ;

select   from dual;

select acos(cos(radians(37.53435601627652)) * cos(radians(37.53435601627652))) - cos(radians(127.13619958327628) - radians(127.13619958327628)) from dual;


select pharmseq, name, address, phone, latitude, longitude
from PHARMACYINFO;


select hpseq, hpname, address, phone, dept, latitude, longitude, distance
from 
(
    select rownum AS rno
         , hpseq, hpname, address, phone, dept, latitude, longitude, distance
    from
    (
        select hpseq, hpname, address, phone, dept, latitude, longitude
            ,substr(DISTNACE_WGS84(37.563398, 126.98633090000001, latitude, longitude),1,instr(DISTNACE_WGS84(37.563398, 126.98633090000001, latitude, longitude), '.', 1,1)+1) as DISTANCE
        from hospitalinfo
        where 1 = 1
            and address like '%'|| '' ||'%'
            and address like '%'|| '' ||'%'
            and address like '%'|| '' ||'%'				
            and dept like '%'|| '' ||'%'				
            and hpname like '%'|| '' ||'%'	 
        order by distance;        
    ) V
    order by distance 
) T
where rno between 1 and 20
order by distance ;


select h.hpseq, h.hpname, h.address, h.phone, h.dept,h.info, h.mainimg, h.subimg1, h.subimg2, r.avg
		from hospitalInfo h join (select hpseq, trunc(avg(rating)) as avg from hospitalreview group by hpseq) r
		on h.hpseq = r.hpseq 
		where h.hpseq=6;


select hpseq, hpname, address, phone, dept, info, mainimg, subimg1, subimg2
from hospitalinfo
where hpseq=2;

select avg(rating) as avg 
from hospitalreview 
where hpseq=6;


select hpseq
from bookmark
where userid='kimmm'
and hpseq = 4;

select*
from user_sequences;

insert into bookmark(bookseq, userid,hpseq) values(bookmarkseq.nextval,'kimmm',5);

select userid, content, regdate, rating
from hospitalreview;

insert into hospitalreview(hpreviewseq,userid,hpseq,content,rating,hpname)
values(hpreviewseq.nextval,'dongdong' , 2 , '좋은병원입니다.<br/>이렇게 하면 엔터 되던가 됐으면 좋겠는데.' , 5 , '(의)미래의료재단리드림의원');


select*
from hospitalinfo;


select*
from member;


delete from hospitalreview;

select userid, content, regdate, rating 
     		from
	     	(select row_number() over (order by hpreviewseq desc) as rno,
	     		userid, content, regDate, rating 
	     	from hospitalreview
	     	where hpseq=2
	     	)V
     	where V.rno between 1 and 5;
        



select*
from HPAPPLICATION;

select rownum as rno, userid, regId, name, infoStatus, hpName
from 
(
    select m.userid, m.regId, m.name, m.infoStatus, h.hpName
    from hpMember m, hospitalinfo h
    where h.hpSeq = m.hpSeq and m.infoStatus in (1,3)
) V;

select*
from hpapplication;


select *
from SCHEDULEEDIT
where submitid = 'gpavtpjw5db';
and day = 1;

select nvl2(s.open, s.day, null) as day, nvl(s.open, null) as open, nvl2(s.open, t.hour, null) as close
		from
		(select s.submitid, s.day, s.close, t.hour as open
		 from SCHEDULEEDIT s left join timetable t
         on s.open = t.hourSeq where s.submitid = 'gpavtpjw5db'
        )s join timetable t
		on s.close = t.hourSeq
		order by day asc;
        

select nvl2(s.open, s.day, null) as day, nvl(s.open, null) as open, nvl2(s.open, t.hour, null) as close
		from
		(select s.day, s.close, t.hour as open
		 from schedule s left join timetable t
         on s.open = t.hourSeq and s.hpSeq = 2
        )s
		join timetable t
		on s.close = t.hourSeq
		order by day asc;
        
        
select userid, content, regdate, rating 
     		from
	     	(select row_number() over (order by hpreviewseq desc) as rno,
	     		userid, content, regDate, rating 
	     	from hospitalreview
	     	where hpseq=2
	     	)V
     	where V.rno between 1 and 5;        
        
select*
from hospitalinfo;

commit;

select*
from user_tab_columns
where table_name ='HOSPITALREVIEW';

select*
from member;




select rownum as rno, userid, regId, name, status, hpName, submitId
from 
(
    select m.userid, m.regId, m.name, h.status , h.hpName, h.submitId,h.uploaddate
    from hpMember m, hpApplication h
    where h.hpSeq = m.hpSeq and h.status in (1,3)
    order by h.uploaddate desc
) V
where rownum between 1 and 10;


 select department_id, count(*)
    from employees
    group by department_id
    having count(*) >=10;
    
    
    select*
    from member;
    
    select*
    from infoboard;

select*
from hospitalreview;

insert into hospitalreview(hpreviewseq,userid,hpseq,content,rating,hpname)
values(hpreviewseq.nextval,'leenn' , 2 , '얄<br/>리<br/>얄<br/>리<br/>얄라성<br/>얄라리얄라' , 4 , '(의)미래의료재단리드림의원');

commit;

            

select h.status , m.userid, m.regId, m.name,  h.hpName, h.submitId
from hpMember m, hpApplication h
where h.hpSeq = m.hpSeq and h.status in (1,3)
order by h.uploaddate desc;

select count(*)
		from hospitalreview
		where hpseq = 2;



