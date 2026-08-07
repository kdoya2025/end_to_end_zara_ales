# Zara Sales — End-to-End Data Science Project

## Project Overview

This project is an end-to-end data science project based on a Zara sales dataset containing **253 records**.

The objective was to build a complete data analytics and machine learning workflow, starting from data cleaning with **MySQL**, continuing with exploratory data analysis using **Python**, building machine learning models to predict **unit price**, and finally creating an interactive **Power BI dashboard** to communicate the results.

### Project Workflow

**Raw Data → MySQL Data Cleaning → Python EDA → Feature Engineering → Machine Learning → XGBoost Prediction → Power BI Dashboard**

---

## 1. Data Cleaning and Analysis with MySQL

The first step was to clean and prepare the raw dataset using **MySQL**.

To preserve the original dataset, I created a **staging table** before performing any transformations.

### SQL techniques used

* Common Table Expressions (CTEs)
* `ROW_NUMBER()`
* Aggregate functions
* `GROUP BY`
* `ORDER BY`
* `ALTER TABLE`
* `UPDATE`
* `DELETE`
* String manipulation using `SUBSTRING_INDEX()`

### Duplicate Handling

I used `ROW_NUMBER()` over relevant columns to identify potential duplicate records.

A CTE was then created to analyze the duplicate records. No duplicates were found in the dataset, so no additional table was required for duplicate removal.

### Data Standardization

I standardized the date information by:

* Splitting date-related values using `SUBSTRING_INDEX()`
* Creating a dedicated date column
* Converting the resulting values into the appropriate date format
* Handling missing/null values
* Verifying data consistency

I also used aggregate functions such as `SUM()`, `AVG()`, and `COUNT()` to perform initial analysis directly in MySQL.

After completing the cleaning and initial analysis, the cleaned dataset was exported to CSV for further analysis in Python.

---

# 2. Exploratory Data Analysis with Python

The cleaned dataset was analyzed in **Google Colab** using:

* Pandas
* NumPy
* Matplotlib
* Seaborn

Before starting the EDA, I verified the imported dataset to ensure that the data remained consistent after exporting it from MySQL.

I also converted the date column into the appropriate datetime format using Pandas.

### Key Business Insights

#### Promotion by Product Category

The percentage of products under promotion was:

| Product Category | Products on Promotion |
| ---------------- | --------------------: |
| Jackets          |                48.19% |
| Jeans            |                35.35% |
| Shoes            |                50.67% |
| Sweaters         |                48.88% |
| T-Shirts         |                43.57% |

Shoes had the highest proportion of products under promotion, while jeans had the lowest.

### Promotion Impact on Revenue

The analysis showed different effects of promotions across product categories:

* Promotions were associated with increased revenue for **jackets, shoes, and T-shirts**.
* Promotions were associated with lower revenue for **jeans and sweaters**.

This suggests that the effectiveness of promotions may depend on the product category.

### Seasonal Impact on Revenue

The analysis also examined the relationship between seasonality and revenue:

* **Jackets and sweaters:** limited seasonal impact on revenue.
* **Shoes and T-shirts:** relatively light seasonal impact.
* **Jeans:** a more noticeable seasonal impact.

---

# 3. Machine Learning

After completing the EDA, I developed machine learning models to predict **unit price**.

### Data Preprocessing

Before training the models, I prepared the features using:

* `SimpleImputer` for missing values
* `OneHotEncoder` for categorical variables
* `StandardScaler` for numerical feature scaling

The dataset was then divided into:

* **60% Training**
* **20% Validation**
* **20% Testing**

### Models Evaluated

I compared several regression algorithms using **Root Mean Squared Error (RMSE)**.

| Model             |      RMSE |
| ----------------- | --------: |
| Linear Regression |     50.92 |
| Decision Tree     |     47.38 |
| Random Forest     |     50.25 |
| XGBoost           | **44.85** |

### Best Model: XGBoost

**XGBoost achieved the lowest RMSE of 44.85**, making it the best-performing model among the algorithms tested.

The model was therefore selected as the final prediction model.

I also created a prediction function that accepts new input values, applies the same preprocessing pipeline, and uses the trained XGBoost model to generate a unit-price prediction.

---

# 4. Power BI Dashboard

After completing the data analysis and machine learning stages, I created an interactive **Power BI dashboard** to present the main business insights.

The dashboard provides a visual overview of:

* Sales performance
* Revenue
* Product categories
* Promotion analysis
* Seasonal trends
* Key performance indicators

The dashboard makes it easier to communicate the results of the analysis to business stakeholders.

---

# 5. Tools & Technologies

### Data Cleaning & SQL

* MySQL
* SQL
* CTEs
* Window Functions

### Data Analysis

* Python
* Pandas
* NumPy

### Data Visualization

* Matplotlib
* Seaborn
* Power BI

### Machine Learning

* Scikit-learn
* XGBoost

### Environment

* Google Colab

---

# 6. Key Skills Demonstrated

This project demonstrates my ability to build an end-to-end data science workflow, including:

* Data cleaning
* SQL data manipulation
* Data validation
* Exploratory data analysis
* Feature engineering
* Data preprocessing
* Regression modeling
* Model comparison
* Model evaluation using RMSE
* XGBoost
* Business insight generation
* Data visualization
* Power BI dashboard development

---

## Conclusion

This project allowed me to combine **SQL, Python, machine learning, and Power BI** into a complete data science workflow.

The analysis identified how promotions and seasonality affected different product categories, while the machine learning stage showed that **XGBoost provided the best prediction performance among the tested models**, with an RMSE of **44.85**.

