# Netflix SQL + Power BI Analysis

## 📌 Objective

To perform end-to-end data analysis on the Netflix Movies and TV Shows dataset using SQL for data cleaning and transformation, and Power BI for interactive dashboard visualization.

---

## 📂 Dataset

The dataset contains information about Netflix content including:

- Title
- Type (Movie / TV Show)
- Director & Cast
- Country
- Date Added
- Release Year
- Rating
- Duration
- Genre (listed_in)

---

## 🛠 Tools Used

- Microsoft SQL Server (SSMS)
- Microsoft Power BI

---

## 🧹 Data Cleaning (SQL)

- Handled missing values in `country`, `director`, and `cast`
- Removed unwanted characters (commas, symbols)
- Trimmed extra spaces and standardized text fields
- Fixed inconsistent country formats

---

## 🔄 Data Transformation (SQL)

- Converted `date_added` from text to DATE format
- Extracted `duration` into:
  - `duration_num`
  - `duration_type`

- Created numeric `show_id_num` for proper sorting
- Prepared dataset for analysis

---

## 📊 Analysis Performed (SQL)

- Movies vs TV Shows distribution
- Top countries producing content
- Content growth over time
- Genre distribution
- Rating distribution
- Advanced queries using window functions:
  - RANK
  - DENSE_RANK
  - LAG

---

## 📈 Power BI Dashboard

An interactive dashboard was created to visualize key insights:

### Dashboard Features:

- KPI Cards (Total Titles, Movies, TV Shows, Avg Duration)
- Content growth trend over time
- Movies vs TV Shows distribution
- Top countries by content
- Genre distribution
- Rating distribution
- Interactive filters (Year, Type, Country)

---

## 🎨 Dashboard Design

- Dark theme inspired by Netflix UI
- Red highlight color (#E50914)
- Clean and minimal layout for better readability

---

## 🔥 Key Insights

- Majority of content on Netflix consists of Movies
- Significant growth in content after 2015
- United States is the leading contributor of content
- TV-MA is the most common rating
- Drama and Comedy are the most popular genres

---

## 📌 Conclusion

This project demonstrates:

- Strong SQL skills (data cleaning, transformation, analysis)
- Ability to handle real-world messy datasets
- Use of advanced SQL functions for analytical insights
- Data visualization and dashboard creation using Power BI

---

## 📁 Project Structure

```
Netflix-SQL-PowerBI-Analysis/
│
├── data/
├── sql/
├── powerbi/
├── outputs/
└── README.md
```

---

## 🚀 Future Improvements

- Add Power BI DAX measures for deeper analysis
- Integrate Python for advanced analytics
- Deploy dashboard online

---
