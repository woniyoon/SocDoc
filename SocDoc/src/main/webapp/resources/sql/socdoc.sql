show user;

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
     