# office_sql_project
Creating a database for Scratton's top Paper Company and building queries to learn more about their business.

# Database Architecture and Relationships
View the 'company_database_structure.png' to see the tables within the company's database, the attributes within each table, and how they relate to each other.

# Creating Tables and Executing Queries for Analysis
View the 'office_queries.sql' script to see my queries for creating the tables and additional queries I used for analysis to learn more about the company's work, the employees, and clients.I populated data in the tables outside of this script.

# Creating a Trigger for When New Employees are Added
View the 'office_trigger_add_employee.sql' to see my queries for creating a new Trigger table and instantiating the trigger for whenever a new employee is added. It is worth noting that this trigger query requires you to change your delimiter. I was using PopSQL for this project, which does not allow you to do this. So I had to create this trigger inside a MySQL terminal.

# Office Insights
View a few quick insights to better understand the business. One can determine if it is a equal opportunity employer by looking at pay grouped by gender, one could learn more about the materials they supply, or one could see who the top performing sales people are. The charts were made using PopSQL's dashboarding tool. You can view them in the 'Office_Insights.pdf' and you can view the queries that made these charts in 'office_insights.sql'.
