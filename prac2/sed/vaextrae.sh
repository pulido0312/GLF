sed -n  '/Valladolid/{ 
	s/;[a-zA-Z][[a-zA-Z]*;/-/ 
	s/;[[:digit:]]*;[[:digit:]]*$// 
	w ../data/vaextrae.csv
	}' <../data/poblacion_municipios_ine_2019.csv
sed -i "1i\CodigoProvincia-CodigoMunicipio;NombreMunicipio;Población" ../data/vaextrae.csv
