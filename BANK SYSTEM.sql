CREATE TABLE Bank
(
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  PRIMARY KEY (code)
);

CREATE TABLE Branch
(
  Address VARCHAR(255) NOT NULL,
  B_ID INT NOT NULL,
  code VARCHAR(255) NOT NULL,
  PRIMARY KEY (B_ID),
  FOREIGN KEY (code) REFERENCES Bank(code)
);

CREATE TABLE Employee
(
  FName VARCHAR(120) NOT NULL,
  LName VARCHAR(120) NOT NULL,
  Salary FLOAT NOT NULL,
  B_Date VARCHAR(255) NOT NULL,
  ID INT NOT NULL,
  Sex VARCHAR(120) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  B_ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (B_ID) REFERENCES Branch(B_ID)
);

CREATE TABLE Admin_
(
  UserName VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Employee(ID)
);

CREATE TABLE Customer
(
  SSN INT NOT NULL,
  Fname VARCHAR(255) NOT NULL,
  Lname VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  sex VARCHAR(120) NOT NULL,
  Bdate VARCHAR(120) NOT NULL,
  phone VARCHAR(11) NOT NULL,
  B_ID INT NOT NULL,
  PRIMARY KEY (SSN, phone),
  FOREIGN KEY (B_ID) REFERENCES Branch(B_ID)
);

CREATE TABLE Loan
(
  L_number INT NOT NULL,
  L_Amount FLOAT NULL,
  L_Type VARCHAR(255) NULL,
  Status VARCHAR(120) NULL,
  ID INT NULL,
  B_ID INT NOT NULL,
  Account_number INT NOT NULL,
  PRIMARY KEY (L_number),
  FOREIGN KEY (ID) REFERENCES Employee(ID),
  FOREIGN KEY (Account_number) REFERENCES Account(Account_number),
  FOREIGN KEY (B_ID) REFERENCES Branch(B_ID)
);

CREATE TABLE Account
(
  Account_number INT NOT NULL,
  Account_Type VARCHAR(255) NOT NULL,
  Account_Balance FLOAT NOT NULL,
  B_ID INT NOT NULL,
  SSN INT NOT NULL,
  phone VARCHAR(11) NOT NULL,
  PRIMARY KEY (Account_number),
  FOREIGN KEY (B_ID) REFERENCES Branch(B_ID),
  FOREIGN KEY (SSN, phone) REFERENCES Customer(SSN, phone)
);

CREATE TABLE Emp_Login
(
  USERNAME VARCHAR(255) NOT NULL,
  PASS VARCHAR(255) NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Employee(ID),
  UNIQUE (USERNAME)
);

CREATE TABLE HELD_BY
(
  L_number INT NOT NULL,
  Account_number INT NOT NULL,
  PRIMARY KEY (L_number, Account_number),
  FOREIGN KEY (L_number) REFERENCES Loan(L_number),
  FOREIGN KEY (Account_number) REFERENCES Account(Account_number)
);

CREATE TABLE Deal_With
(
  SSN INT NOT NULL,
  phone VARCHAR(11) NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (SSN, phone, ID),
  FOREIGN KEY (SSN, phone) REFERENCES Customer(SSN, phone),
  FOREIGN KEY (ID) REFERENCES Employee(ID)
);