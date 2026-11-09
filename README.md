# 2015 U.S. Flight Delays: Airline and Airport Analysis

**Interactive dashboard:** [View on Tableau Public](https://public.tableau.com/views/2015FlightDelays_17941923366370/FinalDashboard)

## Question
Which airlines and airports had the worst arrival delays in 2015, and when did delays peak?

## Data
Kaggle "2015 Flight Delays and Cancellations" dataset, originally from the U.S. Department of Transportation's Bureau of Transportation Statistics. Three tables:

- `flights`: 5,819,079 rows, one per flight
- `airlines`: airline codes and names (14 airlines)
- `airports`: airport codes and names

## Tools
- DuckDB (database) and DBeaver (SQL editor)
- Tableau Public (dashboard)

## Method
1. Loaded the three CSV files into DuckDB.
2. Joined `flights` to `airlines` on the airline code, and to `airports` on the destination airport code.
3. Used `GROUP BY` to calculate average arrival delay and flight counts by airline, by airline and destination airport, and by month.
4. Used `HAVING` to keep only airline-airport pairs with a minimum number of flights, so averages are not driven by small samples.
5. Exported the summary results as CSV files and built a Tableau Public dashboard with one airline filter that controls the airport and monthly charts.

## Data quality notes
- **Cancelled flights:** cancelled flights have no arrival delay value, so they are excluded from all delay averages and counts.
- **October airport codes:** 486,165 flights, all in October, use numeric origin airport IDs instead of three-letter codes. These do not match the `airports` table, so any join on airport code leaves them out. I did not separately check the destination airport column for the same issue.
- **Delay-cause columns:** the five delay-cause columns appeared sparsely populated, so I did not use them.

## Findings
1. The average arrival delay across 2015 flights was 4.41 minutes.
2. Among airlines serving Philadelphia, Spirit Air Lines flights averaged 27.49 minutes late (1,218 flights) and Frontier averaged 21.14 minutes (2,570 flights). American averaged 1.07 minutes (20,849 flights) and US Airways 4.21 minutes (19,838 flights).

These are descriptive associations. The data does not show why any airline or airport ran late.

## Limitations
- Covers 2015 only, so it describes that year and not current performance.
- Airport-level results may leave out flights whose airport codes did not match (see October note above).
- Airline-airport pairs below the minimum flight count are not shown.
- Average delay is affected by very late flights, so it does not describe a typical flight.

## Repository contents
- `sql/`: the SQL queries used
- `outputs/`: summary CSV files used in Tableau
- The raw Kaggle files are not included because of their size. Download them from the Kaggle dataset page.
