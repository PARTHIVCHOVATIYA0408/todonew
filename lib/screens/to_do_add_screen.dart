import 'package:flutter/material.dart';

import 'package:todo/model/to_do_model.dart';

class DataEnterScreen extends StatefulWidget {
  final ToDoModel? item;
  const DataEnterScreen({Key? key, this.item}) : super(key: key);

  @override
  State<DataEnterScreen> createState() => _DataEnterScreenState();
}

class _DataEnterScreenState extends State<DataEnterScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null) {
      titleController.text = widget.item!.title!;
      dateController.text = widget.item!.date!;
      timeController.text = widget.item!.time!;
      descriptionController.text = widget.item!.description!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("ToDo Add"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Enter title ...",
              filled: true,
              fillColor: Colors.teal.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );

              debugPrint("date ----------->> $pickedDate");
              dateController.text = pickedDate.toString().split(" ").first;
              setState(() {});
            },
            child: TextField(
              controller: dateController,
              enabled: false,
              decoration: InputDecoration(
                hintText: "Enter Date ...",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                filled: true,
                fillColor: Colors.teal.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async {
              TimeOfDay? pickTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              debugPrint("Time ---------->> ${pickTime!.format(context)}");
              timeController.text = pickTime.format(context);
              setState(() {});
            },
            child: TextField(
              controller: timeController,
              enabled: false,
              decoration: InputDecoration(
                hintText: "Enter Tile ...",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                filled: true,
                fillColor: Colors.teal.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: descriptionController,
            minLines: 5,
            maxLines: 7,
            decoration: InputDecoration(
              hintText: "Enter Description ...",
              filled: true,
              fillColor: Colors.teal.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              ToDoModel todoModel = ToDoModel(
                title: titleController.text,
                date: dateController.text,
                time: timeController.text,
                description: descriptionController.text,
              );
              Navigator.pop(context, todoModel);
            },
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(double.infinity, 45),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.teal.shade400),
            ),
            child: const Text("Add ToDo"),
          ),
        ],
      ),
    );
  }
}
