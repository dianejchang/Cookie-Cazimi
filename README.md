# Overview
This repository contains an analysis of past sales data from my home bakery, Cookie Cazimi, aimed at identifying the flavor preferences of my local community. The goal is to determine which product base flavors and add-in categories best align with customer tastes and prioritize them for the upcoming year.

Each week, I offer a rotating selection of cookie flavors at the local farmers market, which operates from April to the end of November. This data will guide my 2025 weekly offerings to increase revenue and help establish a standard menu by 2026.
# Data Sources
Data was collected via two Point of Sales systems, Square and HotPlate, between May and December 2024.
# Tools & Technologies
- GitHub Pages for project hosting and SQL documentation
- Google Sheets for data cleaning, pivot tables, and visualizations
- Lucidchart for schema mapping
- PostgreSQL for SQL queries
- Tableau for visualizations
# Project Structure
### 1. Schema Mapping: [Mapped dataset schema](https://drive.google.com/file/d/1VHe8FHuB_1ELHzrgR6Q9j8C-r-a2YhZL/view?usp=sharing) using Lucidchart
### 2. Database Creation for SQL: [Created CSV files in Google Sheets](https://docs.google.com/spreadsheets/d/1XWDW-rlg2smpr5kfeQ3M3IfVQq9Lwmq0sefOD8G5xSw/edit?gid=2025780335#gid=2025780335) to upload in PostgreSQL
### 3. SQL Queries: [Queried and analyzed 2024 sales](https://github.com/dianejchang/Cookie-Cazimi/blob/main/2024%20Sales.sql) in PostgreSQL.
### 4. Tableau Visualizations: Visualized insights for easy interpretation and analysis
- [Summary](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/Summary)
- [Conclusion](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/Conclusion)
- [2024 Sales Overview](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/2024SalesOverview)
- [Sales by Venue](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/SalesbyVenue)
- [Best Selling Product Base Flavors (PBF)](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/BestSellingProductBaseFlavorsPBF_1)
- [Best Selling Add-Ins](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/BestSellingAdd-Ins)
- [Signature PBF Add-Ins](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/SignaturePBFAdd-Ins)
- [Lemon PBF Add-Ins](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/LemonPBFAdd-Ins)
- [Choc PBF Add-Ins](https://public.tableau.com/app/profile/diane.chang/viz/CookieCazimi/ChocPBFAdd-Ins)
### 5. Database Creation for Pivot Tables: Structured data for pivot table analysis - 
- [Product Sold (original)](https://docs.google.com/spreadsheets/d/1OsPwNVErjDuB6vxbAGwtE_Lntyod4CCz6DLKGRFDTyo/edit?gid=8254207#gid=8254207)
- [Product Ingredients (original)](https://docs.google.com/spreadsheets/d/1OsPwNVErjDuB6vxbAGwtE_Lntyod4CCz6DLKGRFDTyo/edit?gid=424442305#gid=424442305)
### 6. Data Cleaning: Cleaned and organized the following datasets
- [Product Sold](https://docs.google.com/spreadsheets/d/1OsPwNVErjDuB6vxbAGwtE_Lntyod4CCz6DLKGRFDTyo/edit?gid=122741989#gid=122741989)
- [Product Ingredients](https://docs.google.com/spreadsheets/d/1OsPwNVErjDuB6vxbAGwtE_Lntyod4CCz6DLKGRFDTyo/edit?gid=1784493945#gid=1784493945)
### 7. Pivot Table Analysis: Analyzed Most Popular Product Base Flavors (PBF), Most Popular PBF by Venue, and Best-Selling Add-In Categories for the Top 3 PBFs
- [Most Popular Product Base Flavors](https://docs.google.com/spreadsheets/d/1OsPwNVErjDuB6vxbAGwtE_Lntyod4CCz6DLKGRFDTyo/edit?gid=1534329371#gid=1534329371) (using clean Product Sold data)
- [Most Popular Product Base Flavors by Venue](https://docs.google.com/spreadsheets/d/1OsPwNVErjDuB6vxbAGwtE_Lntyod4CCz6DLKGRFDTyo/edit?gid=914106830#gid=914106830) (using clean Product Sold data)
- [Best Selling Add-ins for Top 3 Product Base Flavors](https://docs.google.com/spreadsheets/d/1OsPwNVErjDuB6vxbAGwtE_Lntyod4CCz6DLKGRFDTyo/edit?gid=155571409#gid=155571409) (using clean Product Ingredients data)
# Key Insights
### The top 3 Product Base Flavors (PBF) in 2024 were Signature, Lemon, and Chocolate.
- **Signature PBF:** Chocolate and Fruit were the most popular Add-Ins.
    - Chocolate Chip and White Chocolate Berry were the best sellers.
- **Lemon PBF:** Fruit was the most popular Add-In.
    - Lemon Blueberry and Lemon Raspberry were the best sellers.
    - Despite having the least add-in variety, Lemon PBF maintained high popularity.
- **Chocolate PBF:** Chocolate and Nuts were the most popular Add-Ins.
    - Double Chocolate Chip and Turtle were the best sellers.
    - Chocolate PBF offered the most add-in variety with more fillings and miscellaneous options than the Signature or Lemon PBFs did.

### This analysis has helped narrow down key focus areas for product offerings in 2025.
- Every market day showing will have Signature, Lemon, and Chocolate PBFs.
    - **Nut and Filling Add-In options for Signature and Lemon PBFs** will be extended based on the mild success seen in Chocolate PBF.
    - **Chocolate Add-In options for Lemon PBF** will be increased, following its success in Signature and Chocolate PBFs.
    - **Fruit Add-In options for Chocolate PBF** will be expanded due to its popularity in Signature and Lemon PBFs.
- Fruit, Nut, and Filling Add-In options will be available regardless of PBF.
- A known 2024 Best Seller will be at every market day to boost sales and mitigate possible underselling options.
# Updates
This repository will be updated with 2025 sales data to assess how the upcoming strategy performs based on the 2024 insights.
# About Me
My name is Diane Chang and I am a data analyst with 9+ years experience transforming data into actionable insights.

At my core, I am an investigator. I dig deep and connect the dots to extract meaningful insights, enabling teams to make informed decisions. I excel at cataloging information to help visualize complex problems, creating colorful dashboards, and obsessing over details that can drive strategic decisions.

#### [Let's connect on LinkedIn!](https://www.linkedin.com/in/dianejchang/)
