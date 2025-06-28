create table BankTeam(
memberId int identity (1, 1) not null,
FirstName varchar(25) not null,
LastName varchar(25) not null,
Age int check (Age >= 18),
Email varchar(40) unique,
PhoneNumber int unique,
UserName varchar(255) unique not null,
Password varchar (25) not null,
Designation varchar(30) not null check(Designation in ('Admin', 'Account Manager', 'Transaction Manager', 'Financial Products Coordinator')),
);

create table Client(
ClientId int identity (1, 1) not null,
constraint pk_client primary key (clientId),
FirstName varchar(25) not null,
LastName varchar(25) not null,
UserName varchar(255) unique not null,
Password varchar (25) not null,
ClientPhoto image not null,
DOB date not null,
Gender char(1) not null check(Gender in ('M', 'F')),
Age int check (age >= 18),
Address varchar(50), 
City varchar(50) not null,
State varchar(50) not null,
Email varchar(40) unique,
Phone int unique,
CNIC varchar(20) unique not null
);

create table Account(
AccId int identity (1, 1) not null,
constraint pk_acc primary key (AccId),
ClientId int not null,
constraint fk_acc foreign key (ClientId) references Client(ClientId),
AccType varchar(20) not null check(AccType in ('Saving', 'Current')),
Balance int default 0,
Status varchar(15) not null default 'Active'
);

create table Transactions(
TransId int identity (1, 1) not null,
constraint pk_trans primary key (TransId),
AccId int not null,
constraint fk_trans foreign key (AccId) references Account(AccId),
TransType varchar(20) not null check(TransType in ('Deposit', 'Withdraw')),
Amount int not null,
TransDate date not null default getdate()
);

create table AccountAlert(
AlertId int identity (1, 1) not null,
constraint pk_alert primary key (AlertId),
ClientId int not null,
constraint fk_alert foreign key (ClientId) references Client(ClientId),
AlertType varchar(20) not null,
Status varchar(15) not null default 'Active'
);

create table Loans(
LoansId int identity (1, 1) not null,
constraint pk_loans primary key (LoansId),
ClientId int not null,
constraint fk_loans foreign key (ClientId) references Client(ClientId),
LoanType varchar(20) not null,
Amt int not null,
Status varchar(15) not null default 'Pending',
ApprovalDate date  default null 
);

--create table DebitCard(
--CardId int identity (1, 1) not null,
--constraint pk_card primary key (CardId),
--ClientId int not null,
--constraint fk_card foreign key (ClientId) references Client(ClientId),
--CardType varchar(15) not null check(CardType in ('Silver', 'Gold', 'Platinum')),
--CardNumber char(16) not null unique default CONCAT(RIGHT(YEAR(GETDATE()), 2), '-', RIGHT(REPLICATE('0', 14) + CAST(CardID AS varchar(14)), 14)),
--Pin char(4) not null,
--Limit int not null,
--Status varchar(15) not null default 'Active',
--);

CREATE TABLE DebitCard (
    CardId INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT pk_card PRIMARY KEY (CardId),
    ClientId INT NOT NULL,
    CONSTRAINT fk_card FOREIGN KEY (ClientId) REFERENCES Client(ClientId),
    CardType VARCHAR(15) NOT NULL CHECK (CardType IN ('Silver', 'Gold', 'Platinum')),
    Pin CHAR(4) NOT NULL,
    Limit INT NOT NULL,
    Status VARCHAR(15) NOT NULL DEFAULT 'Active'
);
ALTER TABLE DebitCard
ADD CardNumber AS 
    (CONCAT(
        RIGHT(YEAR(GETDATE()), 2), 
        '-', 
        RIGHT(REPLICATE('0', 14) + CAST(CardID AS varchar(14)), 14)
));

CREATE TABLE MoneyTransfer (
    TransferID INT PRIMARY KEY IDENTITY(1,1),
    FromAccID INT NOT NULL,
    CONSTRAINT fk_fromAccount FOREIGN KEY (FromAccID) REFERENCES Account(AccID),
    ToAccID INT NOT NULL,
    CONSTRAINT fk_toAccount FOREIGN KEY (ToAccID) REFERENCES Account(AccID),
    TransferAmt int NOT NULL,
    TransferDate DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE CustomerSupport (
    SupportID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT NOT NULL,
    CONSTRAINT fk_client FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    Subject VARCHAR(100) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    RequestType VARCHAR(50) NOT NULL CHECK (RequestType IN ('Technical Issue', 'Account Inquiry', 'Complaint')),
    RequestDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(50) NOT NULL DEFAULT 'In Progress' CHECK (Status IN ('In Progress', 'Resolved')),
    Reply VARCHAR(255) DEFAULT 'Waiting for Reply',
    ReplyDate DATETIME NOT NULL DEFAULT GETDATE()
);

