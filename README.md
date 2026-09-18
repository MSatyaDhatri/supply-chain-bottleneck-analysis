# Supply Chain Bottleneck Analysis using SQL

## About the Project

-I worked on this project to understand how SQL can be used to analyze real supply chain problems.
-The dataset contains 5,000 shipment records with information about transport mode, weather conditions, origin and destination ports, product category, lead time, geopolitical risk, carrier reliability and shipment disruptions.
-My main goal was to find out what factors were causing longer delivery times and higher disruption rates.
-I used PostgreSQL and pgAdmin 4 for the SQL analysis.

## Questions I Tried to Answer

While working on the dataset, I focused on a few questions:

- What is the overall disruption rate?
- Which transport mode takes the longest time?
- How much does weather affect deliveries?
- Are some origin ports experiencing more delays?
- Which product categories face more disruptions?
- Does geopolitical risk affect shipment performance?
- Does carrier reliability make a difference?
- What combination of factors creates the biggest bottleneck?

## Data Preparation

Before starting the analysis, I checked the dataset for missing and inconsistent values.

I found one record where the origin port was blank. Instead of deleting the complete record from the dataset, I excluded it only when doing the origin port analysis.

The final dataset used for the overall analysis contained 5,000 shipment records.

## Overall Results

I started by calculating a few basic KPIs to understand the dataset.

| Metric | Result |
|---|---:|
| Total Shipments | 5,000 |
| Average Lead Time | 19.36 days |
| Average Carrier Reliability | 0.75 |
| Total Disruptions | 3,063 |
| Disruption Rate | 61.26% |

The first thing that stood out to me was the disruption rate. Out of 5,000 shipments, 3,063 were disrupted, which is around 61%.

## What I Found

### Transport Mode

I compared Air, Rail, Sea and Road shipments.

Sea transport had the highest average lead time at **39.80 days**.

Air was much faster with an average lead time of **1.65 days**.

Interestingly, the disruption rates for the different transport modes were fairly close to each other, so the bigger difference between them was the delivery time.

### Weather Conditions

Weather showed one of the clearest patterns in the project.

| Weather | Avg. Lead Time | Disruption Rate |
|---|---:|---:|
| Hurricane | 53.50 days | 100.00% |
| Storm | 19.30 days | 79.54% |
| Fog | 9.89 days | 48.07% |
| Rain | 7.74 days | 41.97% |
| Clear | 6.70 days | 36.98% |

All 990 shipments under hurricane conditions were disrupted.

Clear weather had the lowest average lead time and the lowest disruption rate, while hurricane and storm conditions showed much worse results.

### Origin Ports

I also grouped the shipments by origin port.

Shanghai had the highest average lead time among the ports in the analysis at **21.36 days**.

Hamburg had the highest disruption rate at **62.48%**.

The differences between most ports were not extremely large, but this helped me identify which ports would be worth investigating further.

### Product Categories

For product categories, I found that:

- Perishables had the highest average lead time at **20.13 days**
- Textiles had the highest disruption rate at **64.85%**
- Electronics had the lowest average lead time at **17.76 days** and the lowest disruption rate among the product categories at **59.55%**

### Geopolitical Risk

I divided the geopolitical risk score into three groups: Low Risk, Medium Risk and High Risk.

| Risk Level | Avg. Lead Time | Disruption Rate |
|---|---:|---:|
| High Risk | 22.90 days | 73.67% |
| Medium Risk | 19.24 days | 61.71% |
| Low Risk | 15.79 days | 47.58% |

This was another clear pattern in the data.

As the geopolitical risk category increased, both average lead time and disruption rate also increased.

### Carrier Reliability

I grouped carriers into Low, Medium and High Reliability categories.

Low-reliability carriers had a **65.74% disruption rate**, compared with **56.01%** for high-reliability carriers.

However, their average lead times were quite similar.

So in this dataset, carrier reliability showed a clearer difference in disruption rate than in delivery time.

## Biggest Bottleneck I Found

I wanted to go beyond analyzing one column at a time, so I combined weather condition, transport mode and geopolitical risk.

The most severe combination I found was:

**Hurricane + Sea + High Risk**

- 79 shipments
- 136.81 days average lead time
- 100% disruption rate

This was the strongest bottleneck I found in the analysis.

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- Microsoft Excel / CSV

## SQL Concepts Used

During this project I worked with:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `COUNT()`
- `AVG()`
- `ROUND()`
- `CASE`
- `FILTER`
- Conditional aggregation
- NULL / blank value handling

## What I Learned

This project helped me understand that SQL analysis is not just about writing queries.

I first had to decide what business question I wanted to answer, choose the right columns, calculate the required metrics and then compare the results.

It also showed me why looking at multiple factors together can be more useful than analyzing each factor separately. The Hurricane + Sea + High Risk combination was a good example of this.

## Project Files

- `supply_chain_analysis.sql` - SQL queries used for the analysis
- Supply chain dataset - data used for the project
- SQL case study - detailed explanation of the analysis and findings

## Author

**Medida Satya Dhatri**  
