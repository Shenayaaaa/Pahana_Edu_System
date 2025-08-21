📘 PahanaEdu Management System
Overview

The PahanaEdu Billing Management System is a Java-based monolithic web application developed using the 3-tier architecture (Presentation, Service, Data).
The system manages educational resources, staff, customers, categories, and billing operations.
It is built with SOLID principles, ensuring clean code, separation of concerns, and easy maintainability.

The application provides role-based access with Admin and Staff dashboards, while business logic is handled in Service and Mapper layers. The database is managed using SQL Server (SSMS), and JUnit test cases ensure reliable functionality.

✨ Features

Authentication & User Roles

Secure login & registration system.

Role-based dashboards: Admin and Staff.

Admin Dashboard

Manage staff accounts.

Manage customer records.

Oversee billing and data.

Staff Dashboard

Manage books & categories.

Generate and process bills.

Track sales and transactions.

Book & Category Management

CRUD operations for books and categories.

Structured data organization with mappers.

Billing System

Create invoices & add bill items.

Track financial transactions.

Testing & Code Quality

JUnit tests for DAOs, services, and business logic.

Code structured using SOLID design principles.

🏗️ Architecture

Architecture Style: Monolithic

Layers: 3-Tier

Presentation Layer (Controllers/Servlets) – Handles UI and user requests.

Service Layer (Services + Mappers) – Implements business logic and enforces rules.

Data Layer (DAOs, Entities, DTOs) – Manages persistence and database interaction.

⚙️ Tech Stack

Backend: Java (Servlets, JDBC, SOLID principles)

Frontend: JSP, HTML, CSS

Database: SQL Server (SSMS)

Services: Mapper & Service layers for business logic

Testing: JUnit

Architecture: Monolithic, 3-tier layered

Build Tool: Maven


 ├── controllers/       # Servlets & Controllers (Login, Register, Admin, Staff, Billing, etc.)
 ├── services/          # Business logic (Service classes)
 ├── mappers/           # Converters between Entities and DTOs
 ├── dao/               # DAO Interfaces
 ├── dao/impl/          # DAO Implementations + Database Connection
 ├── dto/               # Data Transfer Objects
 ├── entities/          # Entity classes (Book, Staff, Customer, Bill, etc.)
 ├── tests/             # JUnit test cases for DAOs & Services
