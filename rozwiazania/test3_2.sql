
select K1.klient_id, K1.segment, avg(Z1.wartosc/(Z1.data_zamkniecia-Z1.data_otwarcia)) as srednia_klienta, T1.srednia_segmentu from zlecenia Z1
	left join klienci K1 on Z1.klient_id = K1.klient_id
	inner join
		(select avg(T2.srednia) as srednia_segmentu, T2.segment from
			(select avg(Z2.wartosc/(Z2.data_zamkniecia-Z2.data_otwarcia)) as srednia, K2.segment from zlecenia Z2
				left join klienci K2 on Z2.klient_id = K2.klient_id
				group by Z2.klient_id) T2
			group by T2.segment) T1
		on T1.segment = K1.segment
	group by Z1.klient_id    
	having srednia_klienta > T1.srednia_segmentu

