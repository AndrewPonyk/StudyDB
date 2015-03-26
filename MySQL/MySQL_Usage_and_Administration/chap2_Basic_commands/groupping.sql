select * from db1.airport;

select AirportID, AirportName, count(*)
from db1.airport
group by AirportName;

-- stupid example sql
select AirportID,AirportName, count(*)
from db1.airport;

-- correct groupping , airports count by contry , only countries with 2 and more airport
SELECT CountryCode, count(airportid)
FROM db1.airport
group by CountryCode
having count(airportid) >=2