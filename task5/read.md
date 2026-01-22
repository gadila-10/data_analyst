Loaded the Titanic dataset using pandas.read_csv() to begin data analysis.

Used .head() and .info() to understand column types and missing values.

Identified missing values using .isnull().sum().

Filled missing Age values with the median to avoid skew from outliers.

Filled missing Embarked values with the mode since it is categorical.

Checked and removed duplicate rows using .drop_duplicates().

Converted continuous Age values into categorical AgeGroup for better analysis.

Feature engineering improves insights and model performance.

Saved the cleaned dataset using .to_csv() for reuse and reporting.
