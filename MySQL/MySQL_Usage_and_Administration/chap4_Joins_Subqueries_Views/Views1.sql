drop view if exists v_round_trip_routes;
CREATE VIEW v_round_trip_routes AS
SELECT r1.RouteID, r1.From, r1.To, r1.Distance
FROM route AS r1, route AS r2
WHERE r1.From = r2.To
AND r2.From = r1.To;

-- select from view
select * from v_round_trip_routes;

-- subquery with views ))
select * from
(select * from v_round_trip_routes ) as s;

CREATE VIEW v_timetable AS
SELECT DISTINCT r.RouteID, a1.AirportCode AS FromAirport,
a2.AirportCode AS ToAirport, f.FlightID,
 fd.DepTime, fd.DepDay
 FROM route AS r, flight AS f,
 flightdep AS fd, airport AS a1,
 airport AS a2
 WHERE f.FlightID = fd.FlightID
 AND r.RouteID = f.RouteID
 AND r.From = a1.AirportID
 AND r.To = a2.AirportID;