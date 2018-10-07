select max(T1.wartosc)/sum(T1.wartosc)*100 as procent, K1.nazwa as 'lider', K1.segment from
	(select sum(Z2.wartosc) as wartosc, K2.segment as segment, K2.klient_id as klient from klienci K2
		inner join zlecenia Z2 on Z2.klient_id = K2.klient_id
		group by K2.segment, K2.klient_id
		order by 2, 1 desc) T1
        left join klienci K1 on T1.klient = K1.klient_id
        group by T1.segment

