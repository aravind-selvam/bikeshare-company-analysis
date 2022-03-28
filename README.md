# Bikeshare_company
This is the project from [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) this case study is to verify my learnings on google data analytics course
###  Background
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert **Casual Riders into members**. 

## Ask
Questions will guide the future marketing program
* How do annual members and casual riders use Cyclistic bikes differently?
* Why would casual riders buy Cyclistic annual memberships?

My Key Stakeholders are *Lily Moreno* and *Cyclistic executive team*
#### Business task 
Find out the casual rider's and annual member's patterns and help the company in organizing marketing campaigns. 

## Prepare
The Cyclistic data is provided in this [Link](https://divvy-tripdata.s3.amazonaws.com/index.html), The data has been made available by
Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement), The orginal name was changed to cyclistic to make this company fictional, I am using 12 months data from the link provided and sorted it and archived the orginal dataset in seperate folder.
## Process
I have choosen Postgres SQL as my tool to clean the data
##### Data_cleaning_steps
* I created a table with proper data type and imported all csv files into single table.
* Excluded Geographic data.
* Removed duplicate rows.
* Checked for typos and other anomolies.
* Removed rows where start time is greater than the end time.
* Removed rows which had null values in Start station and end station name.
* Renamed some columns for easy reading and understanding.
* Created new column which had ride length duration 
* Exculded outliers like trips with less than 1 min duration

U can see my data cleaning and manipulation steps [link to SQL code](https://github.com/aravind9722/Bikeshare_company/blob/main/data_clean.sql)
## Analyze
 I used Postgres SQL for Analyzing my data.
 I wanted to analyse the pattern between two users i.e Casual users and Annual members.
 #### Analysis_steps
 Explored and extracted following points from dataset
 * Total count of rides made by Casual and Member users. 
 * Total rides made on each Day of week.
 * Extracted Length of each rides and calculated total,mean,max,min of of ride duration.  
 * Prefered Bike model by each user type.
 * Top 10 crowded start station by Casual and Annual members.
 * Number of rides done on each day, month.

U can check my analysis work [Link to SQL code](https://github.com/aravind9722/Bikeshare_company/blob/main/my_analysis.sql)
## Share
Tools used = Postgres SQL for analysis
*Tableau* and *Excel* for chart visualization
### Total rides by each user type
![user_type](https://user-images.githubusercontent.com/97881558/160364660-77fd54af-9344-4855-a8a2-7df439df9403.png)
with this we can see annual member share 59% of total rides, which is very clear that annual members take most rides, but still they contribute less revenue how? u will get answers with further slides,

### Total rides by Bike type
![biketype_ball](https://user-images.githubusercontent.com/97881558/160366268-a2af2654-e962-4094-bbd3-82d32df4189d.png)
77% of the rides where on docked bikes,e-bikes and classic bikes share 13% and 10% respectively,

### Total rides by bike type and user type
![Bike_type](https://user-images.githubusercontent.com/97881558/160368472-582dd9f7-d886-4926-9ca0-b16af179fc2e.png)
most people dont choose E_bikes which generate more revenue than other two types, so we can give promotional offers for annual packages for ebikes to increase revenue.
and also create some promotional discounts for increasing the annual subscription among people. 

### Overall Ride Traffic by months
![Ride_months](https://user-images.githubusercontent.com/97881558/160370491-1e3d82bd-1220-4c3e-b386-852c12b1f42d.png)
Here July to October is where most rides were done which is summer season, people use very less bikes on winters which is November to March, we can definitely use this data to plan employees and bike availabilty based on this analysis

### Ride Traffic based on each hour
![Ride_time](https://user-images.githubusercontent.com/97881558/160365673-1e7ee5ba-7fc9-456d-b179-fda15b446f68.png)
So our business objective is to covert casual users to annual members, so we focus our analysis on casual users, Looks like casual users are crowded in evening time around 5pm-6PM , So we can plan marketing campaign during that time, but which have to choose the correct day of the week.

### Ride traffic based on each day
![Ride_Day](https://user-images.githubusercontent.com/97881558/160369104-39d10833-81f7-4f54-9536-f080088a12c5.png)
We can see ride traffic is significantly more by both users (causal, annual members) on saturdays, now we found marketing campaign can be done on saturday evenings, but we have to choose good location for marketing campaigns.

### Top 10 Crowded stations by Casual riders

![Top 10](https://user-images.githubusercontent.com/97881558/160369629-aaef725d-f5c4-4ec2-8013-af52f6bc1bd8.png)

Now we can see Top 10 stations from Streeter Dr & Grand Ave to Michigan Ave is most visited by casual users so with this analysis results
we can plan for campaigns in these top 10 places on Friday and saturday evenings to promote our new discounts and packages among casual users.

### Dashboard created for the company cyclistic 
![Cyclistic](https://user-images.githubusercontent.com/97881558/160371959-3ced16f4-4015-4d62-aa84-60d4f1413419.png)
Dashboard is uploaded to my [Tableau public](https://public.tableau.com/views/GoogleDataAnalyticsCapstoneProject_16484612248570/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)
Can be used by the company for live monitoring the data.

## Act
My recommendations for the *Cyclistic Marketing Executive* and *Lily Moreno* are 

* Offer discounted annual memberships in Summer months.
* Member exclusive deals on ebikes and classic bikes.
* Conduct customer survey on why people dont choose classic bikes over docked bikes.
* Aim Marketing campaigns majorly in top 10 Casual user crowded stations
* More bikes on weekends, and discount for annual members for saturday rides.




