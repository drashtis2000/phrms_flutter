import 'package:flutter/material.dart';
import 'package:phrms/BudgetManagementField.dart';
import 'package:phrms/ExpenseTrackingField.dart';
import 'package:phrms/IncomeStatementsField.dart';
import 'package:phrms/TaxationField.dart'; // Import your finance sub-module fields

class FinanceItem {
  final String title;
  final String identifier;

  FinanceItem(this.title, this.identifier);
}

List<FinanceItem> financeItems = [
  FinanceItem("Expense Tracking", "expense_tracking"),
  FinanceItem("Budget Management", "budget_management"),
  FinanceItem("Income Statements", "income_statements"),
  FinanceItem("Taxation", "taxation"),
];

class FinanceManagement extends StatelessWidget {
  static const String id = "Finance-Management-Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Image.asset(
              'assets/images/microsoftteamsimage.png',
              width: 40,
            ),
            SizedBox(width: 10), // Replace with the desired width
            Text("Finance Management"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Expense Tracking",
                  description: "Description of Expense Tracking...",
                  identifier: "expense_tracking",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Budget Management",
                  description: "Description of Budget Management...",
                  identifier: "budget_management",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Income Statements",
                  description: "Description of Income Statements...",
                  identifier: "income_statements",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Taxation",
                  description: "Description of Taxation...",
                  identifier: "taxation",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldBox(BuildContext context, {required String title, required String description, required String identifier}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "expense_tracking") {
          Navigator.pushNamed(context, ExpenseTrackingField.id);
        } else if (identifier == "budget_management") {
          Navigator.pushNamed(context, BudgetManagementField.id);
        } else if (identifier == "income_statements") {
          Navigator.pushNamed(context, IncomeStatementsField.id);
        } else if (identifier == "taxation") {
          Navigator.pushNamed(context, TaxationField.id);
        } else {
          // Handle other finance sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

