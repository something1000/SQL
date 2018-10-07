-- zadanie nie zrobione na aktualnej dacie tylko wybranej tak aby na przykladowych danych zobaczyc rezultat

select TMP1.klient_id, TMP1.wartosc, TMP1.data_opuszczenia  from 
					(select K2.klient_id, sum(wartosc) as wartosc, Pom1.wart_seg, max(Z1.data_otwarcia) as 'data_opuszczenia' from klienci K2
						inner join zlecenia Z1 on K2.klient_id = Z1.klient_id
						inner join (select K3.segment as segment, avg(Z3.wartosc) as 'wart_seg' from klienci K3
										inner join zlecenia Z3 on K3.klient_id = Z3.klient_id
										group by K3.segment) Pom1 
								on K2.segment = Pom1.segment
						where wartosc>=0.3*Pom1.wart_seg 
						group by K2.klient_id) TMP1
where TMP1.klient_id not in
						(select K4.klient_id from klienci K4
							inner join zlecenia Z4 on K4.klient_id = Z4.klient_id
							where Z4.data_otwarcia > '2014-01-01')

    