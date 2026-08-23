# Ashish Book Shop

A Java-based online book shop web application developed using **Java, Servlets, JSP, JDBC, Oracle Database, HTML, CSS and JavaScript**.

## Features

- Customer registration and login
- Customer logout
- View available books
- Add books to cart
- Buy books
- Edit customer details
- Admin login
- Add books
- View books
- Edit/update books
- Delete books
- Servlet + DAO based database operations

## Technologies Used

- Java
- Servlet
- JSP
- JDBC
- Oracle Database
- HTML5
- CSS3
- JavaScript
- Apache Tomcat
- Eclipse IDE

## Project Structure

```text
AshishBookShop/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/abs/
│       │       ├── bean/
│       │       ├── dao/
│       │       ├── database/
│       │       └── service/
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── css/
│           ├── images/
│           ├── js/
│           └── *.jsp / *.html
├── .gitignore
└── README.md
```

## Requirements

Before running the project, install/configure:

1. JDK compatible with the project
2. Eclipse IDE for Enterprise Java and Web Developers
3. Apache Tomcat
4. Oracle Database
5. Oracle JDBC driver (`ojdbc6.jar` or a compatible driver for your Oracle/JDK setup)


## Database Schema

The application uses the following Oracle Database tables.

### 1. Book1

Stores book information.

```sql
CREATE TABLE Book1 (
    bcode   VARCHAR2(10),
    bname   VARCHAR2(35),
    bauthor VARCHAR2(35),
    bprice  NUMBER(10,2),
    bqty    NUMBER(10),
    PRIMARY KEY (bcode)
);
```

| Column | Data Type | Description |
|---|---|---|
| `bcode` | `VARCHAR2(10)` | Unique book code / primary key |
| `bname` | `VARCHAR2(35)` | Book name |
| `bauthor` | `VARCHAR2(35)` | Author name |
| `bprice` | `NUMBER(10,2)` | Book price |
| `bqty` | `NUMBER(10)` | Available quantity |

### 2. Admin

Stores administrator account and contact details.

```sql
CREATE TABLE Admin (
    uname VARCHAR2(15),
    pword VARCHAR2(15),
    fname VARCHAR2(15),
    lname VARCHAR2(15),
    addr  VARCHAR2(15),
    mid   VARCHAR2(25),
    phno  NUMBER(15),
    PRIMARY KEY (uname)
);
```

| Column | Data Type | Description |
|---|---|---|
| `uname` | `VARCHAR2(15)` | Admin username / primary key |
| `pword` | `VARCHAR2(15)` | Admin password |
| `fname` | `VARCHAR2(15)` | First name |
| `lname` | `VARCHAR2(15)` | Last name |
| `addr` | `VARCHAR2(15)` | Address |
| `mid` | `VARCHAR2(25)` | Email ID |
| `phno` | `NUMBER(15)` | Phone number |

Example admin record:

```sql
INSERT INTO Admin
VALUES (
    'YOUR_ADMIN_USERNAME',
    'YOUR_ADMIN_PASSWORD',
    'Ashish',
    'Maurya',
    'xyz',
    'your-email@example.com',
    9000000000
);
```

### 3. Customer

Stores customer account and contact details.

```sql
CREATE TABLE Customer (
    uname VARCHAR2(15),
    pword VARCHAR2(15),
    fname VARCHAR2(15),
    lname VARCHAR2(15),
    addr  VARCHAR2(100),
    mid   VARCHAR2(25),
    phno  NUMBER(15),
    PRIMARY KEY (uname)
);
```

| Column | Data Type | Description |
|---|---|---|
| `uname` | `VARCHAR2(15)` | Customer username / primary key |
| `pword` | `VARCHAR2(15)` | Customer password |
| `fname` | `VARCHAR2(15)` | First name |
| `lname` | `VARCHAR2(15)` | Last name |
| `addr` | `VARCHAR2(100)` | Customer address |
| `mid` | `VARCHAR2(25)` | Email ID |
| `phno` | `NUMBER(15)` | Phone number |

### Complete Schema Setup

Create the tables in this order:

```sql
CREATE TABLE Book1 (
    bcode VARCHAR2(10),
    bname VARCHAR2(35),
    bauthor VARCHAR2(35),
    bprice NUMBER(10,2),
    bqty NUMBER(10),
    PRIMARY KEY (bcode)
);

CREATE TABLE Admin (
    uname VARCHAR2(15),
    pword VARCHAR2(15),
    fname VARCHAR2(15),
    lname VARCHAR2(15),
    addr VARCHAR2(15),
    mid VARCHAR2(25),
    phno NUMBER(15),
    PRIMARY KEY (uname)
);

CREATE TABLE Customer (
    uname VARCHAR2(15),
    pword VARCHAR2(15),
    fname VARCHAR2(15),
    lname VARCHAR2(15),
    addr VARCHAR2(100),
    mid VARCHAR2(25),
    phno NUMBER(15),
    PRIMARY KEY (uname)
);
```

## Database Configuration

The project uses Oracle Database with:

```text
jdbc:oracle:thin:@localhost:1521:xe
```

Open:

```text
src/main/java/com/abs/database/DBInfo.java
```

and replace:

```java
YOUR_ORACLE_USERNAME
YOUR_ORACLE_PASSWORD
```

with your local Oracle username and password.


## JDBC Driver

The Oracle JDBC JAR is intentionally not included in this GitHub-ready folder. Add the appropriate Oracle JDBC driver to the project's runtime classpath / `WEB-INF/lib` before running the application.

## Running in Eclipse

1. Import the project into Eclipse as an existing Java/Web project.
2. Configure Apache Tomcat in Eclipse.
3. Configure the Oracle JDBC driver.
4. Configure your Oracle database and required tables/data.
5. Update `DBInfo.java` with your local database credentials.
6. Add the project to the Tomcat server.
7. Start Tomcat.
8. Open the application in your browser using the deployed context path.

## Security Note

Database credentials and generated `.class` files are intentionally excluded from the GitHub repository.

## 👨‍💻 Developed By

**Ashish Maurya**

Master of Computer Applications (MCA)

Academic Project

---

## 📜 License

This project has been developed for academic and educational purposes only.

---

# ⭐ Thank You

Thank you for reviewing the **Ashish Book Shop** project.
