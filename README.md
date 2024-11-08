# Fast-commerce-sql-dmdd

This project contains the database structure and data for the Fast grocery delievery system. It includes the DDL, DML views and user grants scripts necessary to create and populate tables, views, and other database components. Follow the instructions below to set up and work with this database.

## Table of Contents
1. Prerequisites
2. Installation
3. User setup
4. Running DDL and DML Scripts
5. Views
6. Git Workflow
7. How and What to Run

---

### Prerequisites

To run this project, ensure you have the following:
- Oracle SQL or compatible database client
- Basic understanding of SQL and Git
- Access to this repository

---

### Installation

1. Clone this repository to your local machine:
    ```
    git clone https://github.com/sinhakushagra21/fast-commerce-sql-dmdd.git
    ```

2. Make sure your database client is properly connected and authenticated to the database where these scripts will be run.

---

### User Setup.

1. - Before running the DDL and DML scripts, you need to create a user account in your Oracle database and assign the necessary     permissions to allow table creation, data insertion, and other required operations.

- Connect to your Oracle database as an admin user.

- Run the **/main.sql** file to create a new user.

---

### Running DDL and DML Scripts

The project is organized into a series of scripts for defining (DDL) and manipulating (DML) data. Each section has a main script that coordinates all related operations.

1. **DDL Scripts**: Start by setting up the database structure using the main DDL script. This script will create all necessary tables, indexes, and other objects.
   
    ```sql
    {path_to_files}/fast-commerce-sql-dmdd/sqlQueries/sql_queries/ddl/create_tables/create_ddl_main.sql
    ```

    - **Note**: We have handled the case of dropign the table if already exists. The DDL script includes `DROP` statements to remove existing objects if necessary.

    - **Note**: This package also includes individual creation of tables in-case of creating tables individually.

2. This will allow the user USER18GP to create, insert, and manage data within the specified tables for this project.

. Run the ***grant.sql*** Script:
The grant.sql script handles creating roles with specific privileges, defining users, and assigning roles. Execute this script to complete the role and user setup:

    ```sql
        {path_to_files}/fast-commerce-sql-dmdd/sqlQueries/sql_queries/grants/grant_access.sql
    ```

    Explanation of Roles and Permissions:

    1. Admin_role: Full access to all tables and views in the database, allowing comprehensive control.

    2. User_role: Limited access, primarily for users with purchasing permissions (inserting and updating orders and payments, viewing products).

    3. Warehouse_manager_role: Access to manage stock levels in the database, but restricted from viewing sensitive user data.
    User Accounts Created:



2. **DML Scripts**: Once the structure is in place, populate the tables using the main DML script.

    ```sql
    {path_to_repo_files}/fast-commerce-sql-dmdd/sqlQueries/sql_queries/dml/insert_data/insert_dml_main.sql
    ```

    - **Note**:  This will insert initial data into the tables, including sample data necessary for testing the project.
    - **Note**:  This package also includes individual insertion of data into tables in-case of inserting data into tables individually.

---

### Views

    The views are created separately after the DDL and DML steps are complete. To create the views, run:

    ```sql
    {path_to_repo_files}/fast-commerce-sql-dmdd/sqlQueries/sql_queries/views/insert_data/views_main.sql
    ```

- **Note**:  This will create views. It has individual views as well.

---

### Git Workflow

- Git Access

You have read-only access to this repository, which means:

You can clone the repository and make local modifications for your testing and development needs.
Any changes you make will be local and cannot be pushed back to the repository.

---

### How and What to Run

1. **Create User**: Run the **/main.sql** file and follow the user setup and grant access.

2. **Initialize Database Structure**: Run the main DDL script first to create all tables and database objects.

3. **Grant Access**: Run the grant access sql file. {/sqlQueries/sql_queries/grants/grant_access.sql}
   
4. **Insert Sample Data**: Run the main DML script to populate tables with data.

5. **Create Views**: Finally, run the views_main creation script to set up views for specific data access.

---

### Files to run

1. Run /main.sql

2. Run /sqlQueries/sql_queries/ddl/create_tables/create_ddl_main.sql

3. Run /sqlQueries/sql_queries/grants/grant_access.sql

4. Run /sqlQueries/sql_queries/dml/insert_data/insert_dml_main.sql

5. Run /sqlQueries/sql_queries/views/views_main.sql

