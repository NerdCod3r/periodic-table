# Periodic Table Database

This project is part of freeCodeCamp's **Relational Database Certification**. It involves creating a PostgreSQL database containing information about chemical elements, including their atomic number, symbol, name, atomic mass, melting and boiling points, and type.

## Project Overview

The **Periodic Table Database** is designed to:
- Store element data in a relational structure using PostgreSQL.
- Utilize SQL queries to retrieve, insert, and manipulate data.
- Practice database design principles including primary keys, foreign keys, and constraints.

## Features
- **Database Schema:** Three related tables (`elements`, `properties`, `types`).
- **SQL Queries:** Data retrieval using `JOIN` operations.
- **Command Line Interaction:** Query elements using a Bash script.

## Setup Instructions

1. **Clone the Repository**
   ```sh
   git clone https://github.com/NerdCod3r/periodic-table.git
   cd periodic-table
   ```

2. **Create and Connect to Database**
   ```sh
   psql --username=freecodecamp --dbname=postgres
   ```
   Then, create the database using the database dump file, periodic_table.sql:
   ```sql
   psql -U postgres < periodic_table.sql
   ```
3. **Run the Bash Script**
   ```sh
   ./element_info.sh 1  # Example: Fetch Hydrogen details
   ```

## Usage
- Fetch element details by atomic number, symbol, or name.
- Extend the database by adding more elements and their properties.

## Technologies Used
- PostgreSQL
- SQL
- Bash

## License
This project follows freeCodeCamp's guidelines. Feel free to modify and expand it.

---

🚀 
