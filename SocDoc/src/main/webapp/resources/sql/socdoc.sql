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
