import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importing intl for date formatting

import '../utils/app_colors.dart';

class ListOfTask extends StatefulWidget {
  const ListOfTask({
    super.key,
     this.taskItems,  this.deleteItems,  this.statusChange,
  });

  final List? taskItems;
  final Function(String)?  deleteItems,statusChange;

  @override
  State<ListOfTask> createState() => _ListOfTaskState();
}

class _ListOfTaskState extends State<ListOfTask> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {


        // Parsing and formatting the createdDate


        return Card(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text("description"),
                Text("15-12-2002"), // Display formatted date
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildTaskStatusChip(),
                    Wrap(
                      children: [
                        IconButton(
                          onPressed: (){
                           // widget.statusChange(taskItem["_id"]);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: (){
                            //widget.deleteItems(taskItem["_id"]);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper method to format the date
  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the date string
    return DateFormat('yyyy-MM-dd').format(dateTime); // Format to 'yyyy-MM-dd'
  }

  void _onTapEditButton() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Status"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ["New", "Completed", "Cancelled", "Progressed"].map((e) {
              return ListTile(
                onTap: () {},
                title: Text(e),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _onTapDeleteButton() {
    // Handle delete button tap


  }

  Widget _buildTaskStatusChip() {
    return Chip(
      label: Text(
       "New",
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      side: const BorderSide(color: AppColors.themeColor),
    );
  }


}
