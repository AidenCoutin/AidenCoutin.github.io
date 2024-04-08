# Introduction
This project was intended to provide an introduction to a complete data science project from start to finish. The initial EDA and modeling was done individually and then groups were formed to enhance the modeling and develop a final product. Only the individual work is loaded in the repository.

The Kaggle competition located [here](https://kaggle.com/competitions/home-credit-default-risk) was used.

# Summary
The objective of this project was to develop a method to predict the risk of default of a person without a credit score. This was a supervised classification problem. The target variable is whether a client would have payment difficulties over an initial time period of the loan. 

# Solution
My [EDA](https://github.com/AidenCoutin/AidenCoutin.github.io/blob/main/IS_6812/Capstone_EDA_AC.Rmd) focused on processing incomplete datasets (with NAs), correcting errors with the data, and integrating variables where it made sense to simplify the model development process in the future. 

The team ended with a boosted decision tree model with good out-of-sample performance that scored well (0.76) on the Kaggle competition's metrics. We found that there was a significant (intuitive) tradeoff between risk to the company and inclusivity that the company would provide. The chart below summarizes this sensitivity.

<img src="sensitivity.jpg?raw=true" width="404" height="242"/>
Fig. 1: Sensitivity of Some Parameters to Prediction Threshold

# Business Value
The model developed can be used to provide HomeCredit with confidence in providing credit to people without prior credit history. The model's threshold can be adjusted based on economic conditions and risk appetite of the company, and could be enhanced in the future to provide more customized solutions to the unbanked population.

# Contribution
My contributions included EDA, model development and testing, technical writing and proofreading, and presentation of results to the professors and other students.

# Challenges and Learnings
The data provided in this analysis was fairly messy and required a large amount of cleaning to be useful. The team found that the cleaning method(s) selected had a large impact on the resulting models' predictive capability. This is not ideal since it makes the analysis more sensitive to the analyst's chosen cleaning methods. This also meant that the team had to align on a cleaned dataset before comparing our respective models. This is likely true for most real-world projects but was the first time I'd encountered it.

During this project, I learned more about the challenges faced when dealing with unbalanced datasets. I also developed my skills in presenting with minimal slides (telling more of the story myself) and received feedback on how to make my messaging even more concise from the professors after the presentation.