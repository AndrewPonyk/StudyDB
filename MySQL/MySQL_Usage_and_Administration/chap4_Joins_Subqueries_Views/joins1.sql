select f.FlightID,at.AircraftName from
flight as f,aircraft as a ,aircrafttype as at
where f.FlightID = 652 and f.AircraftID = a.AircraftID 
and a.AircraftTypeID = at.AircraftTypeID;


select * from flight;
select * from route;
select * from aircraft;
select * from aircrafttype ;

-- How about another? Try finding which of the airline’s flights use airplanes from
-- Boeing:

SELECT f.FlightID, at.AircraftName from 
flight as f, route as r , aircraft as a, aircrafttype as at
where f.RouteID = r.RouteID and f.AircraftID = a.AircraftID
and a.AircraftTypeID = at.AircraftTypeID
and at.AircraftName like 'Boeing%';

-- =============================================================
-- Outer joins : 
-- flight have RouteId and AircraftId 
SELECT r.RouteID, f.FlightID, f.AircraftID
FROM route AS r, flight AS f
WHERE r.RouteID = f.RouteID -- 32 results (because there are 32 flights)
-- AND r.RouteID BETWEEN 1050 AND 1175;
;

-- Example : Left Join
SELECT r.RouteID, f.FlightID, f.AircraftID
FROM route AS r left join flight AS f
on r.RouteID = f.RouteID -- 34 results (because there are 32 flights) routes 1167 and 1071 has no flights
;

select * from aircrafttype;

