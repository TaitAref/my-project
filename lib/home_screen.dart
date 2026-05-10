import 'package:flutter/material.dart';
import 'add_screen.dart';
import 'statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double balance = 0;
  double income = 0;
  double expense = 0;

  List<Map<String, dynamic>> transactions = [];

  void addTransaction(Map<String, dynamic> data) {

    double amount = data["amount"];
    String type = data["type"];

    setState(() {

      if (type == "income") {
        balance += amount;
        income += amount;
      } else {
        balance -= amount;
        expense += amount;
      }

      transactions.add({
        "amount": amount,
        "type": type,
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Budget"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,

        actions: [

          IconButton(
            icon: const Icon(Icons.bar_chart),

            onPressed: () {

              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => StatisticsScreen(
                    income: income,
                    expense: expense,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        onPressed: () async {

          final result = await Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) => const AddScreen(),
            ),
          );

          if (result != null) {
            addTransaction(result);
          }
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(25),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const Text(
                    "الرصيد الحالي",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "\$${balance.toStringAsFixed(2)}",

                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "آخر العمليات",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(

              child: transactions.isEmpty

                  ? const Center(
                child: Text(
                  "لا توجد عمليات",
                ),
              )

                  : ListView.builder(

                itemCount: transactions.length,

                itemBuilder: (context, index) {

                  final item =
                  transactions[index];

                  return Container(

                    margin:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),

                    padding:
                    const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Row(

                      children: [

                        CircleAvatar(

                          backgroundColor:
                          item["type"] ==
                              "income"
                              ? Colors
                              .green
                              .shade100
                              : Colors
                              .red
                              .shade100,

                          child: Icon(

                            item["type"] ==
                                "income"
                                ? Icons
                                .arrow_downward
                                : Icons
                                .arrow_upward,

                            color:
                            item["type"] ==
                                "income"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(

                          child: Text(

                            item["type"] ==
                                "income"
                                ? "دخل"
                                : "مصروف",

                            style:
                            const TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w500,
                            ),
                          ),
                        ),

                        Text(

                          "\$${item["amount"]}",

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                            FontWeight.bold,

                            color:
                            item["type"] ==
                                "income"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}