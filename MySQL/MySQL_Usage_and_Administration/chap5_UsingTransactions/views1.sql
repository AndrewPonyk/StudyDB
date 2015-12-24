 create view v_round_trip_routes as 
 SELECT r1.RouteID, r1.From, r1.To, r1.Distance
 FROM route AS r1, route AS r2
 WHERE r1.From = r2.To
 AND r2.From = r1.To;

drop view v_round_trip_routes;
            
select * from v_round_trip_routes;

show create view v_round_trip_routes;

