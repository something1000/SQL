
    create view dates as 
    select curdate() - INTERVAL(a.a + (10 * b.a) + (100 * c.a) + (1000*d.a)) DAY as Date
    from (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a
    cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b
    cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c
    cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as d;


create view dni_zlecen as 
	select D.Date from dates D 
	where D.Date between (select min(Z.data_otwarcia) from zlecenia Z) and (select max(Z.data_zamkniecia) from zlecenia Z)
    order by D.Date ASC;