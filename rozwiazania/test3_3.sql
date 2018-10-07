select T.obszar_id, year(T.dzien) as 'rok', count(T.dzien) as 'liczba dni' from 
	(select dni_zlecen.Date as dzien, M.obszar_id from dni_zlecen
		cross join zlecenia Z
		left join miasta M on Z.miasto_realizacji_id = M.miasto_id
		where dni_zlecen.Date between Z.data_otwarcia and Z.data_zamkniecia
		group by 1,2
		order by 1) T
	group by T.obszar_id, 2
    
