Overview
This project demonstrates how to perform data analysis using a combination of SQL and Python. The focus is on extracting insights from business data (such as sales, orders, or customer behavior) by leveraging the power of SQL for data manipulation and Python for further analysis.

🔧 Tech Stack
SQL: PostgreSQL (for querying and aggregating data)

Python:

pandas for data manipulation

jupyter notebook or .py script for analysis

Extracted yearly sales data using SQL with CTEs and aggregation.

Compared sales across different years and sub-categories.

Identified top-performing product categories based on year-over-year growth.

Visualized sales trends using Python.

⚙️ Setup Instructions
Clone the repository

bash
Copy
Edit
git clone https://github.com/your-username/sql-python-analytics-project.git
cd sql-python-analytics-project
Set up a virtual environment (optional but recommended)

bash
Copy
Edit
python -m venv venv
source venv/bin/activate  # on Windows: venv\Scripts\activate
Install dependencies

bash
Copy
Edit
pip install -r requirements.txt
Run SQL queries

Use any PostgreSQL client (e.g., pgAdmin, DBeaver, or CLI) to run queries in the queries/ folder.

Make sure your data (e.g., df_orders) is loaded into the database.

Run the Python analysis

Open notebooks/analysis.ipynb in Jupyter or run the Python script for further analysis and plotting.

📈 Sample Output

Year-over-year sales comparison for each product sub-category.

📌 Use Cases
Sales performance monitoring

Marketing campaign evaluation

ETL + analytics portfolio project

📬 Contact
For any questions or collaboration inquiries, feel free to reach out at [deepban.13@gmail.com].
