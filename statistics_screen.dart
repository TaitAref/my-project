import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {

  final double income;
  final double expense;

  const StatisticsScreen({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF181A20),

      appBar: AppBar(
        title: const Text("الإحصائيات"),

        backgroundColor:
        const Color(0xFF181A20),

        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: const Color(0xFF252836),

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  Text(
                    "إجمالي الدخل: \$${income.toStringAsFixed(2)}",

                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "إجمالي المصروف: \$${expense.toStringAsFixed(2)}",

                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}