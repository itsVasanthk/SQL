# 📘 Task 2: Data Insertion and Null Handling — SQL Developer Internship

## 🔍 Objective
This task focuses on practicing **Data Manipulation Language (DML)** operations such as `INSERT`, `UPDATE`, and `DELETE`, while properly handling `NULL` values using constraints and default values in SQL.

---

## 🗃️ Database: `LibraryDB`

This database simulates a library system with tables for:
- Members
- Books
- Reviews

---

## 🛠️ Tools Used
- MySQL (Tested with MySQL 8+)
- DB Fiddle / SQLiteStudio

---

## 📁 Tables Created

### 1. Members
- Stores library member details.
- Fields: `member_id`, `name`, `email`, `phone`, `address`
- Constraints:
  - `name` and `email` are `NOT NULL`
  - `email` is `UNIQUE`
  - `phone` and `address` allow `NULL`

### 2. Books
- Stores information about books.
- Fields: `book_id`, `title`, `author`, `publisher`, `year_published`, `isbn`
- Constraints:
  - `title` and `isbn` are `NOT NULL`
  - `isbn` is `UNIQUE`

### 3. Reviews
- Stores reviews given by members on books.
- Fields: `review_id`, `member_id`, `book_id`, `rating`, `review_text`, `review_date`
- Constraints:
  - `rating` must be between 1 and 5
  - `member_id` and `book_id` are `FOREIGN KEY`s
  - `ON DELETE CASCADE` is used to maintain referential integrity

---

## 💾 Data Operations

### ✅ INSERT
- Inserted complete rows with all values.
- Inserted partial rows allowing `NULL` or default values.
- Used `DEFAULT NULL` for optional fields.

### 🔁 UPDATE
- Updated specific fields using `WHERE` conditions.
- Handled updates where fields were `NULL` using `IS NULL`.

### ❌ DELETE
- Demonstrated safe deletion of members who had reviews using `ON DELETE CASCADE`.
- Ensured no foreign key conflicts during deletion.

---

## ⚠️ NULL & Constraint Handling
- Enforced `NOT NULL` on essential fields.
- Used `DEFAULT NULL` for optional fields like `phone`, `address`, `author`.
- Showed error when inserting into `NOT NULL` fields without a value.
- Used `IS NULL` in `UPDATE` and `SELECT`.


---

## 👨‍💻 Author
**Vasantha Kumar S**  
SQL Developer Internship – Task 2  
August 2025
