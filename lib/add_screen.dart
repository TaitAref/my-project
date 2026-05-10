import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() =>
      _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  final TextEditingController controller =
  TextEditingController();

  String type = "income";

  void save() {

    double amount =
        double.tryParse(controller.text) ?? 0;

    Navigator.pop(
      context,
      {
        "amount": amount,
        "type": type,
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF181A20),

      appBar: AppBar(
        title: const Text("إضافة عملية"),

        backgroundColor:
        const Color(0xFF181A20),

        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: controller,
              keyboardType:
              TextInputType.number,

              style: const TextStyle(
                color: Colors.white,
              ),

              decoration: InputDecoration(
                hintText: "ادخل المبلغ",

                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),

                filled: true,

                fillColor:
                const Color(0xFF252836),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

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
                      padding:
                      const EdgeInsets.all(14),

                      decoration: BoxDecoration(

                        color: type == "income"
                            ? Colors.green
                            .shade300
                            : const Color(
                            0xFF252836),

                        borderRadius:
                        BorderRadius.circular(
                          15,
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          "دخل",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                      padding:
                      const EdgeInsets.all(14),

                      decoration: BoxDecoration(

                        color: type == "expense"
                            ? Colors.red.shade300
                            : const Color(
                            0xFF252836),

                        borderRadius:
                        BorderRadius.circular(
                          15,
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          "مصروف",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: save,

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFF7C83FD),

                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 16,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                ),

                child: const Text(
                  "حفظ",

                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}