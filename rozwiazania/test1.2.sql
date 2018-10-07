select year(data_otwarcia) as rok, obszar_id as obszar ,sum(wartosc) as wartosc, count(zlecenie_id) as 'ilosc zlecen' from zlecenia
	left join klienci on zlecenia.klient_id = klienci.klient_id
    left join miasta on klienci.miasto_id = miasta.miasto_id
    group by obszar_id, rok
    order by 3 DESC
		
