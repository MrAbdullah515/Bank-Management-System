# Bank-Management-System
A comprehensive web application for bank management developed for the Database Systems Lab at FAST-NU, Lahore. DigiBank integrates advanced security measures including facial recognition for user authentication and provides a robust interface for managing customer accounts, transactions, loans, and credit cards. This project is developed by Mannan Ul Haq, Huzaifa Amir, M. Hassan Mustansar, and M. Abdullah Waseem, for the Spring 2024 semester under the Department of Data Science.

Main Features of DigiBank
Admin Interface:

Secure Password Login: Ensure secure access for the admin.
Bank Staff Management: View, manage, and assign roles to bank staff.
Client Data Viewing: Access and review clients' data.
Loans Management: Accept or reject loan applications.
Customer Queries: Respond to customer queries and questions via the integrated message box.
Bank Staff Interface:

Secure Password Login: Ensure secure access for bank staff.
Client Data Management: Enter, verify, and update client data and account details.
Transaction Management: Efficiently manage client transaction records.
Loan Management: Review, process, manage, and track client loans.
Credit Card Management: View, manage, and respond to client credit card requests.
Client Interface:

Facial Recognition Login: Secure login using facial recognition combined with a password.
Money Transfer: Perform money transfers.
Transfer History: Access detailed transfer history.
Customer Support: Contact bank representatives through the integrated message box.
Personal Details: Check and update personal details.
Account and Card Details: View account and card details.
Instructions to Run the Project
To run this project on your Laptop/PC, follow these steps:

Install Python:

Download and install Python from the official website.
Face Recognition Setup:

We use face recognition for client authentication with Python in C# using the python.net library.
We employ the DeepFace library with Google FaceNet models for face recognition.
Copy Python Codes:

Copy the two Python code files provided in the repository folder named Python Codes.
Paste these files in the following directory: C:\Program Files\Python312\Lib.
Install DeepFace Library:

Open Command Prompt and run the following command:
pip install deepface
Remember that when you run a code using Deepface for the first time on your laptop/PC, it needs to download the respective model. For example, if you are using the FaceNet model, it will take some time to download the model the first time you run the face recognition code.
Database Access via Azure:


