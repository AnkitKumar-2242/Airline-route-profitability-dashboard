# Airline Route Profitability & Network Optimization Dashboard (Power BI)

> A 4-page Power BI dashboard that shows which of an airline's 30 routes make money, which lose money, and what to do about each one, using 2024 flight data.

## Short Project Description

This project analyses a full year (2024) of flight-level revenue and cost data for 30 routes of a single airline. It combines DAX measures with an interactive Power BI report to find profitable and loss-making routes, understand passenger demand and load factor, and give every route a rule-based **Expand / Maintain / Improve / Reduce** recommendation.

## Project Overview

Airlines earn very differently across routes. A route can be full of passengers and still lose money, and a half-empty route can still be profitable if its costs are low. This project builds a decision-support dashboard that answers four questions in order:

1. **How is the business doing overall?** (Executive Overview)
2. **Which routes drive or drain profit?** (Route Profitability Analysis)
3. **Where is demand, and how well are seats filled?** (Network & Demand Analysis)
4. **What should be done with each route?** (Route Optimization & Recommendations)

## Business Objectives

- Measure total revenue, cost, profit and profit margin for 2024.
- Identify the most profitable and the loss-making routes.
- Compare Long, Medium and Short Haul route categories.
- Check whether high load factor or high passenger demand actually leads to profit.
- Understand demand by route, aircraft type, season and demand level.
- Turn the analysis into clear, rule-based route recommendations.

## Tools & Technologies

| Tool | Use |
|------|-----|
| Power BI Desktop | Data model, visuals, slicers, report design |
| DAX | Measures, calculated column, route-level recommendation logic |
| Kaggle | Dataset source |
| GitHub | Version control and project sharing |

## Project Workflow / Data Flow

```
Kaggle dataset (flight-level data, 30 routes, 2024)
        |
        v
Load into Power BI  -->  table: airline_flight_analysis
        |
        v
DAX: measures (revenue, profit, margin, load factor ...)
     + calculated column (flight-level Route Recommendation)
     + measure (route-level Route Recommendation)
        |
        v
4 report pages with synced Flight Date slicer
        |
        v
Insights and route recommendations
```

## Data Preparation & Analysis

- All analysis is done on one table, `airline_flight_analysis`, with one row per flight.
- Every KPI was cross-checked across pages (for example, profit 575.48M and margin 24.26% are identical on all four pages; category profits add up to the total; flight counts in the donut and bar charts add up to 7,974).
- The flight-level `Route Recommendation` is a calculated column, so it can be counted per flight. The route-level version is a measure, so each route gets exactly one label in the table.

<!-- If you also did SQL work for this project, add a "SQL Analysis" section here with your queries. -->

## Power BI Dashboard Overview

### 1. Executive Overview

High-level summary for a quick read.

- KPI cards: Total Revenue, Total Cost, Total Profit, Profit Margin, Total Flights, Total Passengers
- Top 5 profitable routes and top 5 loss-making routes
- Flight Profitability donut (profitable vs loss-making flights)
- Revenue trend over time (monthly)
- Performance by route category (revenue, cost, profit)

### 2. Route Profitability Analysis

Where profit comes from and where it leaks.

- Top 10 profitable routes
- Top 10 routes by profit margin (shows which big-profit routes are actually efficient)
- All 8 loss-making routes
- Load Factor vs Route Profit scatter plot
- Total profit by route category, with a Route Category slicer

### 3. Network & Demand Analysis

How demand and capacity behave across the network.

- KPI cards: Total Passengers, Total Flights, Average Load Factor, Average Flight Hours
- Top routes by passenger demand
- Average load factor by aircraft type
- Passengers by route category
- Load factor and flight distribution by demand level
- Season slicer (Low, Normal, Peak, Shoulder)

### 4. Route Optimization & Recommendations

From analysis to action.

- Flights by recommendation (donut) and by recommendation and route category (bar chart)
- Revenue vs cost by route category
- Route-wise recommendations table (route, profit, margin, load factor, recommendation)
- Route Category slicer

## Key KPIs & Metrics

| KPI | Value (2024) |
|-----|--------------|
| Total Revenue | 2.37bn |
| Total Cost | 1.80bn |
| Total Profit | 575.48M |
| Profit Margin | 24.26% |
| Total Flights | 7,974 |
| Total Passengers | 2.03M |
| Average Load Factor | 80.16% |
| Average Flight Hours | 6.33 hrs |
| Loss-making flights | 2,688 (33.71%) |
| Loss-making routes | 8 of 30 |

## Key Business Insights

1. **Long Haul drives the profit.** Long Haul earns 517.32M of the 575.48M total profit, about 90%, and brings about half of all passengers (1.01M of 2.03M).
2. **Short Haul loses money.** Short Haul profit is -19.33M: its cost (0.12bn) is higher than its revenue (0.10bn).
3. **Profit is concentrated.** The top 10 routes give about 98% of net profit. The 8 loss-making routes lose about 43.6M combined (worst: DXB-CAI, -8.19M).
4. **Demand does not guarantee profit.** DXB-LHR has the highest passenger demand (117.07K) but is loss-making (-6.7M).
5. **Big profit is not always high efficiency.** DXB-JFK earns 41.24M but its margin is only 19.30%, while DXB-BKK earns a similar profit at a 42.72% margin.
6. **Load factor alone does not decide profit.** In the scatter plot, routes at about 85% load factor range from a loss to about 100M profit.
7. **Aircraft matter.** The Airbus A380 fills best (84.78% load factor) and the A350-900 least (75.93%).
8. **Every flight has at least Medium demand.** There are no Low-demand flights: 4,630 flights (58.06%) are High and 3,344 (41.94%) are Medium.
9. **Recommendation split (flights).** Expand 3,194 (40.06%), Reduce / Discontinue 2,688 (33.71%), Maintain 1,662 (20.84%), Improve 430 (5.39%).
10. **Seasonality.** Monthly revenue dips in the middle of the year (about 160M in July) and recovers to its highest level in December.

## Dashboard Screenshots

### Dashboard-1 Executive Overview
<img width="649" height="368" alt="dashboard_1_executive_overview" src="https://github.com/user-attachments/assets/dbed519a-7cab-44d4-b8e7-92e48ecef0c6" />


### Dashboard-2 Route Profitability Analysis
<img width="653" height="367" alt="dashboard_2_route_profitability" src="https://github.com/user-attachments/assets/21ca421f-994d-4fe2-8627-19e7b155aa2a" />


### Dashboard-3 Network & Demand Analysis
<img width="651" height="369" alt="dashboard_3_network_demand" src="https://github.com/user-attachments/assets/60e96bc3-0c3b-4ade-bdf6-a2efb9e82cbf" />


### Dashboard-4 Route Optimization & Recommendations
<img width="652" height="366" alt="dashboard_4_route_optimization" src="https://github.com/user-attachments/assets/c74c6618-3f00-45a4-b39c-023945fc758f" />


## Repository Structure

```
.
├── README.md
├── Airline_Route_Analysis_Dashboard.pbix
├── images/
│   ├── dashboard_1_executive_overview.png
│   ├── dashboard_2_route_profitability.png
│   ├── dashboard_3_network_demand.png
│   └── dashboard_4_route_optimization.png
├── dataset/
│   └── airline_route_profitability.csv
|   └── processed_data.csv
|   └── readme
└── airline_route_analysis_queries.sql
```

## Dataset & Data Source

- **Dataset:** [Airline Route Profitability & Cost Analysis](https://www.kaggle.com/datasets/waleedfaheem/airline-route-profitability-and-cost-analysis) on Kaggle
- **Content:** flight-level revenue and cost breakdowns with profitability metrics for 30 routes of a single airline
- **Period used:** 1 Jan 2024 to 31 Dec 2024 (full year)
- **Size in this model:** 7,974 flights
- **Main table:** `airline_flight_analysis` (route, route category, season, demand level, aircraft type, revenue, cost, profit, load factor, passengers, flight hours)

## Dataset Credit / Attribution

The dataset was created by **Waleed Faheem** and is published on Kaggle under the **[Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)** license.

- Original dataset: https://www.kaggle.com/datasets/waleedfaheem/airline-route-profitability-and-cost-analysis
- Changes made: the data was loaded into Power BI and extended with calculated columns and measures (for example `Route Recommendation`). [Add here if you cleaned or filtered any rows.]

This project is not affiliated with or endorsed by the dataset author.

## How to Use the Project

1. Clone or download this repository.
2. Open `airline_route_profitability_dashboard_2024.pbix` in **Power BI Desktop**.
3. Use the slicers to explore:
   - **Flight Date** (synced across all pages)
   - **Route Category** (pages 2 and 4)
   - **Season** (page 3)
4. If Power BI asks for the data source, download the dataset from Kaggle and point the `airline_flight_analysis` query to your local file (Home, Transform data, Data source settings).

## SQL Analysis

<!-- Remove this section if the project has no SQL part, or paste your queries here. -->
This project was built directly in Power BI with DAX. [Add SQL queries here if you used SQL for exploration.]

## DAX Measures

```DAX
Total Revenue = SUM('airline_flight_analysis'[Total_Revenue])
```

```DAX
-- Flight-level recommendation (calculated column)
Route Recommendation =
SWITCH(
    TRUE(),
    'airline_flight_analysis'[Profit_Margin] >= 0.20 &&
    'airline_flight_analysis'[Load_Factor] >= 0.80, "Expand",
    'airline_flight_analysis'[Profit_Margin] >= 0.10 &&
    'airline_flight_analysis'[Load_Factor] >= 0.70, "Maintain",
    'airline_flight_analysis'[Profit_Margin] >= 0, "Improve",
    "Reduce / Discontinue"
)
```

```DAX
-- Route-level recommendation (measure, used in the route-wise table)
Route Recommendation (Route) =
VAR _margin = [Profit Margin]
VAR _lf = AVERAGE('airline_flight_analysis'[Load_Factor])
RETURN
SWITCH(
    TRUE(),
    _margin >= 0.20 && _lf >= 0.80, "Expand",
    _margin >= 0.10 && _lf >= 0.70, "Maintain",
    _margin >= 0, "Improve",
    "Reduce / Discontinue"
)
```

```DAX
Profit Margin = DIVIDE([Total Profit], [Total Revenue])
```

### Recommendation rules

| Recommendation | Rule |
|----------------|------|
| Expand | Profit margin >= 20% and load factor >= 80% |
| Maintain | Profit margin >= 10% and load factor >= 70% |
| Improve | Profit margin >= 0% (Maintain criteria not met) |
| Reduce / Discontinue | Profit margin < 0% (loss-making) |

## Skills Demonstrated

- Dashboard design and storytelling in Power BI (4 connected pages, consistent theme and colours)
- DAX: measures, calculated columns, conditional logic with `SWITCH`, `DIVIDE`, variables
- Data validation: reconciling KPIs across pages and charts
- Business analysis: profitability, load factor, demand and route optimisation
- Interactivity: slicers, synced date filter, edit interactions, conditional formatting
- Documentation and attribution of an open dataset

## Data / Usage Notes

- The dataset covers **one airline's 30 routes and one year (2024)**. Findings describe this route network only, not the airline industry.
- With a single year of data, seasonality and trends cannot be confirmed over time.
- The Kaggle page does not say whether the data is real or synthetic, so treat the insights as an analysis exercise, not as statements about a real airline's finances.
- Recommendations are **rule-based** (margin and load factor thresholds), not a forecasting model.
- The recommendation is assigned per flight in the charts and per route in the table, so a route can have flights in several recommendation groups while its table label is a single value.

## Author

**[Ankit Kumar]**
- GitHub: [AnkitKumar-2242](https://github.com/AnkitKumar-2242)
- LinkedIn: [https://www.linkedin.com/in/ankitkumar369/](https://www.linkedin.com/in/ankitkumar369/)

## Project Highlights / Conclusion

- A complete 4-page dashboard that moves from summary, to route profitability, to demand, to action.
- Clear finding: **Long Haul earns about 90% of profit, Short Haul loses money, and 8 of 30 routes are loss-making.**
- Shows that **high passenger demand and high load factor do not guarantee profit**, which is why margin-based recommendations matter.
- A transparent, rule-based recommendation framework that can be changed by editing the thresholds in DAX.
- Possible next steps: add cost breakdown by type, test different thresholds, build a what-if parameter for margin and load factor cut-offs, and extend to multi-year data.
