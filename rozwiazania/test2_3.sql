-- zadanie zrobione dla lat 2014 i 2013
select K1.segment, 
	   sum(Z1_1.wartosc) as 'rok 2014',
	   sum(Z1_2.wartosc) as 'rok 2013',  
       sum(Z1_1.wartosc) - sum(Z1_2.wartosc) as 'wzrost', 
       (sum(Z1_1.wartosc)/sum(Z1_2.wartosc))*100-100 as 'procentowy wzrost'
	from klienci K1
    inner join zlecenia Z1_1 on K1.klient_id = Z1_1.klient_id
    inner join zlecenia Z1_2 on K1.klient_id = Z1_2.klient_id
    where year(Z1_1.data_otwarcia) = '2014' and year(Z1_2.data_otwarcia) = '2013' 
    group by K1.segment
