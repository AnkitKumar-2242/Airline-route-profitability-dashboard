use airline_route_optimization;

select count(*) as total_rows from raw_airline_flights;

select count(*) - count(distinct Flight_Number) as duplicate_flights
from raw_airline_flights;

SELECT
    SUM(Ancillary_Revenue IS NULL) AS missing_ancillary,
    SUM(Catering_Cost IS NULL) AS missing_catering,
    SUM(Handling_Cost IS NULL) AS missing_handling
FROM raw_airline_flights;

select min(Flight_Date) as stat_date,
		max(Flight_Date) as end_date
from raw_airline_flights;

update raw_airline_flights
set
	Ancillary_Revenue = coalesce(Ancillary_Revenue, 0),
    Catering_Cost = coalesce(Catering_cost, 0),
    Handling_Cost = coalesce(Handling_cost, 0);
    
select count(*) as negative_values
from raw_airline_flights
where Passengers < 0
or Aircraft_Capacity < 0
or Ticket_Revenue < 0
or Total_Revenue < 0
or Total_Cost < 0
or Profit < 0;


SELECT COUNT(*) AS invalid_load_factor
FROM raw_airline_flights
WHERE Load_Factor < 0
   OR Load_Factor > 1;
   
   
SELECT COUNT(*) AS invalid_passenger_capacity
FROM raw_airline_flights
WHERE Passengers > Aircraft_Capacity;


SELECT COUNT(*) AS profit_mismatch
FROM raw_airline_flights
WHERE ABS((Total_Revenue - Total_Cost) - Profit) > 0.01;


SELECT
    SUM(Passengers < 0) AS negative_passengers,
    SUM(Aircraft_Capacity < 0) AS negative_capacity,
    SUM(Ticket_Revenue < 0) AS negative_ticket_revenue,
    SUM(Total_Revenue < 0) AS negative_total_revenue,
    SUM(Total_Cost < 0) AS negative_total_cost,
    SUM(Profit < 0) AS negative_profit
from raw_airline_flights;

SELECT
    Flight_Number,
    Total_Revenue,
    Total_Cost,
    Profit,
    (Total_Revenue - Total_Cost) AS calculated_profit,
    Profit - (Total_Revenue - Total_Cost) AS difference
FROM raw_airline_flights
WHERE ABS((Total_Revenue - Total_Cost) - Profit) > 0.01
LIMIT 10;

SELECT
    COUNT(*) AS margin_mismatch
FROM raw_airline_flights
WHERE ABS(
    Profit_Margin - ((Profit / Total_Revenue) * 100)
) > 0.01;



USE airline_route_optimization;

CREATE TABLE airline_flight_analysis AS
SELECT
    *,
    ROUND((Profit / NULLIF(Passengers, 0)), 2) AS Profit_Per_Passenger,
    ROUND((Total_Revenue / NULLIF(Passengers, 0)), 2) AS Revenue_Per_Passenger,
    ROUND((Total_Cost / NULLIF(Passengers, 0)), 2) AS Cost_Per_Passenger,
    ROUND(Load_Factor * 100, 2) AS Load_Factor_Percentage,
    CASE
        WHEN Profit > 0 THEN 'Profitable'
        WHEN Profit < 0 THEN 'Loss-Making'
        ELSE 'Break-Even'
    END AS Profitability_Status,

    CASE
        WHEN Profit_Margin >= 20 THEN 'High'
        WHEN Profit_Margin >= 10 THEN 'Medium'
        ELSE 'Low'
    END AS Profitability_Level

FROM raw_airline_flights;

select count(*) as total_rows from airline_flight_analysis;

select * from airline_flight_analysis limit 10;


