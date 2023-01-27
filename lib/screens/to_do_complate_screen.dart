import 'package:flutter/material.dart';

import '../utiles/constants.dart';

class ToDoCompleteScreen extends StatefulWidget {
  const ToDoCompleteScreen({Key? key}) : super(key: key);

  @override
  State<ToDoCompleteScreen> createState() => _ToDoCompleteScreenState();
}

class _ToDoCompleteScreenState extends State<ToDoCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("To Do Complete"),
      ),
      body: listOfCompleteData.isEmpty
          ? const Center(
              child: Text(
                "No Data Found ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.separated(
              itemCount: listOfCompleteData.length,
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = listOfCompleteData[index];
                return Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title            : ${item.title}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Date            : ${item.date}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Time           : ${item.time}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Discription : ${item.description}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                // ListTile(
                //   tileColor: Colors.grey.shade400,
                //   title: Text('${item.title}'),
                //   subtitle: Text('${item.description}'),
                //   trailing: Text('${item.time}'),
                // );
              },
            ),
    );
  }
}
