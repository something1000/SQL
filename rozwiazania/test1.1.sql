select year(data_otwarcia) as rok, sum(wartosc) as 'wartosc zlecen' from zlecenia
	group by rok