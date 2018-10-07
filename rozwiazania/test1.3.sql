select M1.nazwa, M1.obszar_id from miasta M1
inner join 
		(select max(T.wartosc), T.miasto from
			(select M2.nazwa as miasto, M2.obszar_id as obszar, sum(Z2.wartosc) as wartosc from miasta M2
				left join zlecenia Z2 on Z2.miasto_realizacji_id = M2.miasto_id
				group by M2.nazwa, M2.obszar_id
				order by 3 desc) T
			group by T.obszar) T2
		on T2.miasto = M1.nazwa