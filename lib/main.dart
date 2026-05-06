import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Budget',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double balance = 0;
  final TextEditingController controller = TextEditingController();

  String type = "income"; // دخل أو مصروف

  void addMoney() {
    double amount = double.tryParse(controller.text) ?? 0;

    setState(() {
      if (type == "income") {
        balance += amount;
      } else {
        balance -= amount;
      }
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Budget"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // 💳 كارد الرصيد
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE7F6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "الرصيد الحالي",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${balance.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ✍️ إدخال المبلغ
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "ادخل المبلغ",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔘 اختيار نوع العملية
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        type = "income";
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: type == "income"
                            ? Colors.green.withOpacity(0.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: type == "income"
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      child: const Center(child: Text("دخل")),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        type = "expense";
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: type == "expense"
                            ? Colors.red.withOpacity(0.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: type == "expense"
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                      child: const Center(child: Text("مصروف")),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔘 زر الإضافة
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addMoney,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD1C4E9),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text("حفظ العملية"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}