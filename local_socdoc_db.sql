show user;

select*
from tabs;


alter table noticeBoard
drop column subject;

alter table noticeBoard
add subject varchar2(500);

delete from noticeBoard
where noticeseq in(1,4,5);

select*
from hospitalinfo;

-- 타임테이블 인서트
insert into timetable values(1, '09:00');
insert into timetable values(2, '10:00');
insert into timetable values(3, '11:00');
insert into timetable values(4, '13:00');
insert into timetable values(5, '14:00');
insert into timetable values(6, '15:00');
insert into timetable values(7, '16:00');
insert into timetable values(8, '17:00');
insert into timetable values(9, '18:00');
insert into timetable values(10, '19:00');

commit;



-- 공지테이블

insert into noticeBoard(noticeSeq, subject, content)
values (noticeSeq.nextval, '「AI기반 응급의료시스템 개발」사업 사전 설명회', '과학기술정보통신부, 보건복지부, 행정안전부, 소방청과 정보통신산업진흥원(NIPA)이 함께 「AI기반 응급의료시스템 개발」 사업 추진을 위한 사전 설명회를 개최합니다. <br/>성공적인 사업 추진을 위해 다양한 의견을 수렴하고자 하오니 관계자 여러분의 많은 관심과 참여 부탁드립니다.<br/><br/><br/>(행사명)「AI기반 응급의료시스템 개발」사업 사전 설명회<br/>(목적)AI기반 응급의료시스템 개발 사업추진계획, 추진방식 등 사전 안내·의견 수렴 및 관심 기관·기업의 참여 유도<br/>(일시/장소) 20.01.08(수) 10:00/엘타워 별관(스포타임) 5층 멜론홀<br/>(참석대상) 응급의료기관(병원, 소방관계자 등), ICT/SW 기업 관계자 등<br/>(프로그램 안내) 첨부파일 참조');

--begin
--    for i in 1..7 loop 
--        insert into noticeBoard(noticeSeq, subject, content)
--        values (noticeSeq.nextval, '2020년 '||i||'월 응급의료기관 및 응급의료기관 외의 의료기관(응급의료시설) 현황', '2020년 '||i||'월 응급의료기관 및 응급의료기관 외의 의료기관(응급의료시설) 현황입니다. (2020-'||i||'-31 기준)<br/>* 응급의료기관: 권역응급의료센터 및 지역응급의료센터, 지역응급의료기관<br/>* 응급의료에 관한 법률 제6장 응급의료기관 등 참조<br/>');
--    end loop;
--end;

insert into noticeBoard(noticeSeq, subject, content)
values (noticeSeq.nextval, '2020년 추석 응급진료기관(병의원 및 약국) 검색 제공 예정','안녕하세요.<br/>2020.09.30.(수) ~ 10.2.(금) 명절 연휴 기간 동안 운영되는 응급진료기관 검색 기능이 제공 될 예정입니다.<br/>비상진료가 필요한 경우 참고하시기 바랍니다.<br/>즐거운 한가위 보내세요.');

insert into noticeBoard(noticeSeq, subject, content)
values (noticeSeq.nextval,'속닥속닥 홈페이지 전산환경 개선을 위한 시스템점검 안내','속닥속닥 홈페이지 전산환경 개선을 위한 시스템점검이 있을 예정입니다.<br/>*해당 점검 시간에는 접속이 불가함</br>
○ 일 시 : 2020.08.28.(금) 04:00 ~ 09:00 (5시간)<br/>○ 문 의 : 02-1644-1818<br/>');



-- 정보테이블

select*
from infoBoard;

update infoBoard set img = '심폐소생술어린이.png'
where infoseq = 7;

commit;



-- 자주찾는질문 테이블

select*
from faqboard;

insert into faqboard(faqseq, question, answer)
values(faqseq.nextval,'Q . 병원 예약이 안 돼요.',
'A . 해당 병원이 예약인원이 다 차서 불가능한 경우 예약 가능 날짜 및 시간이 선택되지 않습니다.<br/>이외의 문의는 해당 병원에 직접 연락하시는 것을 추천드립니다. <br/>시스템 오류로 인한 경우에는 고객행복센터(1644-1818)로 문의 주시면 신속하게 도움 드리겠습니다.');

commit;

