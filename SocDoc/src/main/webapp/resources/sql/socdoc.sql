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
     