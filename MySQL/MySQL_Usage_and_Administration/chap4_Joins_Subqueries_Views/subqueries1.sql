select 100 
from (select 100) as t
where (select 100) > 10;

-- displaying which of the airline’s routes originate at Heathrow Airport
-- USING JOIN : 
select * 
from route as r, airport as a
where r.From=a.AirportID and a.AirportName='Heathrow Airport';

-- USING SUBQUERY
select * 
from route as r
where r.From = (select airport.AirportID  from airport where airport.AirportName='Heathrow Airport');


-- Using EXISTS operator ( simple operator)
select * from aircrafttype
where EXISTS (select * from aircrafttype where AircraftTypeID=504);