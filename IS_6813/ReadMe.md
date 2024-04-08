# Introduction
This project involved using real-life data to address company's business problem / series of questions. The EDA was individual work, and I contributed distinct elements to the modeling and postprocessing efforts. Only the individual work is loaded in the repository.

# Summary
The objective of this project was to develop a method to predict product demand over short windows of time (weeks).

# Solution
My [EDA](https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/EDA_summary.Rmd) focused on using the flavors derived from the ITEM variable in the dataset to predict demand. The flavors (key terms) were derived from the ITEM variable using [this](https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/EDA_ITEM.Rmd) script. This code section ([here](https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/snippet_1.R)) was used to remove PACKAGE descriptions from ITEM to aggregation on the ITEM variable in a simpler and more correct fashion. 

One of my post-processing steps was to derive a normal distribution of the prediction levels from the model, and analyze that output to determine the optimal production recommendation for the company. The methodology applied is included [here]((https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/OptimalProduction.Rmd).

<img src="ProbDist.png?raw=true" width="404" height="242"/>
Fig. 1: Probability Distribution of Demand, and Production Recommendations for Various Overage/Underage Cost Ratios

# Business Value
These efforts supported the business by allowing them to produce more accurately the quantities of product that will be purchased in the order window, minimizing overproduction costs and maximizing the revenue captured.

# Contribution
My contributions included EDA, model development and testing, technical writing and proofreading, and presentation of results to the professors and other students.

# Challenges and Learnings
The primary challenge in this project was learning to manage large datasets. With limited computer resources, success was found by reducing the dataset via aggregation, performing the desired operation on the reduced dataset, and then joining the results back to the large dataset. Azure Databricks (using Pyspark, SparklyR, and SQL commands) was also used to perform data exploration.
