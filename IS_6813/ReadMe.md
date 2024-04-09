# Introduction
This project involved using real-life data to address company's business problem / series of questions. The EDA was individual work, and I contributed distinct elements to the modeling and postprocessing efforts. Only the individual work is loaded in the repository.

# Summary
The business problem and objective of this project was to predict product demand over short windows of time (weeks), for limited-release products. The company provided seven possible questions to address, of which the team downselected four similar questions, which was further reduced to two questions later. 

# Solution
My [EDA](https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/EDA_summary.Rmd) focused on using the flavors derived from the ITEM variable in the dataset to predict demand. The flavors (key terms) were derived from the ITEM variable using [this](https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/EDA_ITEM.Rmd) script. This code section ([here](https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/snippet_1.R)) was used to remove PACKAGE descriptions from ITEM to aggregate on the ITEM variable in a simpler and more correct fashion. 

The team's solution developed an ARIMA model (and methodology) to answer the selected questions.

One of my post-processing steps was to derive a normal distribution of the prediction levels from the model, and analyze that output to determine the optimal production recommendation for the company. The methodology applied is included [here](https://github.com/AidenCoutin/AidenCoutin.github.io/tree/main/IS_6813/OptimalProduction.Rmd).

<img src="ProbDist.png?raw=true" width="404" height="242"/>
Fig. 1: Probability Distribution of Demand, and Production Recommendations for Various Overage/Underage Cost Ratios

# Business Value
These efforts supported the business by allowing them to produce more accurately the quantities of product that will be purchased in the order window, minimizing overproduction costs and maximizing the revenue captured. The OUC ratio allows the company to select the production level that minimizes costs to the company.

# Contribution
My contributions included EDA, model development and testing, technical writing and proofreading, and presentation of results to the professors and other students.

# Challenges and Learnings
The primary challenge in this project was learning to manage large datasets. With limited computer resources, success was found by reducing the dataset via aggregation, performing the desired operation on the reduced dataset, and then joining the results back to the large dataset. Azure Databricks (using Pyspark, SparklyR, and SQL commands) was also used to perform data exploration. 

Additional challenges included the limited amount of data available for specific product types, which required the team to make compromises on the dataset used to train models, as well as the unstructured nature of the ITEM variable, which made correct aggregation difficult.

From this project, I enhanced my skills in R and Databricks, developed my intuition for dealing with large datasets, and learned more about the outputs available from predictive models and how they can be used to understand the prediction better. I also improved my analytical thinking skills and my ability to work through complex problems.
