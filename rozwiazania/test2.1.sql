
		select M2.nazwa, count(Z2.zlecenie_id), sum(Z2.wartosc) from miasta M2
			left join zlecenia Z2 on Z2.miasto_realizacji_id = M2.miasto_id
            left join klienci K2 on Z2.klient_id = K2.klient_id
            left join miasta M22 on M22.miasto_id = K2.miasto_id
            where M2.obszar_id != M22.obszar_id
            group by M2.nazwa
