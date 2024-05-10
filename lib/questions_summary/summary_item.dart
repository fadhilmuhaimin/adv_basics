import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String,Object> data;

  @override
  Widget build(BuildContext context) {
    Color getColor(bool? data) => data == true ? Colors.blue : Colors.red;
    return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getColor(data['is_correct'] as bool)),
                  child: Text(
                    ((data['questions_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (data['questions'].toString()),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (data['user_answer'].toString().toString()),
                        style: const TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        (data['correct_answer'].toString()),
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                )
              ],
            );
  }
}