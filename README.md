# University Sports Park Management System

![Grade](https://img.shields.io/badge/Grade-73%25%20(First%20Class)-brightgreen)
![Module](https://img.shields.io/badge/Module-COM1025%20Web%20%26%20Database%20Systems-blue)
![Tech Stack](https://img.shields.io/badge/Stack-PHP%20%7C%20MySQL%20%7C%20Java-orange)

## � Project Overview

This project was developed for the **COM1025 Web and Database Systems** module (University of Surrey, Year 1, Semester 1). It is a full-stack web application designed to manage a University Sports Park, featuring a robust database backend, a dynamic PHP frontend, and an auxiliary Java component for auction management.

**Key Achievements:**
- **Awarded Grade:** 73% (First Class).
- **Full-Stack Implementation:** Built from scratch using raw PHP and SQL without frameworks to demonstrate core understanding of web technologies.
- **Complex Data Modeling:** Implemented an Enhanced Entity-Relationship (EER) model with advanced constraints.

---

## 🛠️ Technical Highlights

### 1. Database Architecture (MySQL)
The core of the system is a relational database designed to handle staff, members, sessions, and memberships with integrity.
- **Advanced Constraints:** Usage of `CHECK` constraints (e.g., ensuring `SHESH_STime < SHESH_ETime`).
- **Data Integrity:** `ENUM` types for gender and teaching levels to enforce consistency.
- **Relationships:** Complex foreign key mapping for "Gold" and "Silver" membership subclasses inheriting from a base `Membership` table.
- **Security:** Account/Staff separate tables to isolate authentication credentials.

### 2. Backend Logic (PHP)
The web application interface allows users and staff to interact with the database dynamically.
- **Raw PHP:** Demonstrates understanding of server-side scripting, session management, and database connectivity (`PDO`/`mysqli`).
- **Dynamic Content:** Pages adapt based on database state (e.g., displaying available gym sessions dynamically).
- **User Authentication:** Secure login system linking to the `Account` table.

### 3. Object-Oriented Programming (Java)
An independent component demonstrating OOP principles.
- **Auctioneer System:** The `coursework_question1/Auctioneer.java` class models a car auction system.
- **Key Concepts:** Encapsulation, inheritance, and collection management (`HashMap` for tracking sold/unsold items).

---

## 📂 Repository Structure

```
├── website/                # Web Application Source Code
│   ├── index.php           # Main Entry Point
│   ├── db_connect.php      # Database Connection Configuration
│   ├── LogIn.php           # Authentication Request Handler
│   ├── MemberInfo.php      # Member Dashboard
│   └── SignUp.php          # New User Registration
│
├── sql_queries.sql         # Complex SQL queries demonstrating data manipulation
├── db_setup.sql            # DDL Script to initialize database schema and seed data
│
├── coursework_question1/   # Java OOP Component declaration
│   └── Auctioneer.java     # Auction logic implementation
│
├── EERD.png                # Enhanced Entity Relationship Diagram (Database Design)
└── report (updated).pdf    # Detailed academic report covering design decisions
```

---

## 🚀 How to Run

### prerequisites
- **XAMPP/WAMP/MAMP** (or any environment with Apache & MySQL)
- **Java JDK** (for the Auctioneer component)

### Steps
1. **Database Setup:**
   - Open phpMyAdmin (or your preferred SQL client).
   - Import `db_setup.sql` to create the `University_Sports_Park` database and tables.
   - (Optional) Run queries from `sql_queries.sql` to test data retrieval.

2. **Web Application:**
   - Move the `website/` folder to your server's root directory (`htdocs` or `www`).
   - Configure `website/db_connect.php` if your MySQL credentials differ from default.
   - Navigate to `localhost/website/index.php` in your browser.

3. **Java Component:**
   - Navigate to `coursework_question1/`.
   - Compile and run:
     ```bash
     javac coursework_question1/Auctioneer.java
     ```

---

## � Author

**Bipindra Rai**
*BSc Computer Science Student*

This portfolio project demonstrates proficiency in:
- **Relational Database Design (SQL)**
- **Full-Stack Web Development (PHP/HTML/CSS)**
- **Object-Oriented Programming (Java)**
