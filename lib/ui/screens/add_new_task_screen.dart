import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/task_manager_app_bar.dart';


class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {


  bool isLoading = false;


  final _addNewFormKey = GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //appBar: TaskManagerAppBar(profileData: profileData,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 42,),

              Text("Add New Task",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
              const SizedBox(height: 24,),
              Form(
                key: _addNewFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Title is required";

                        }
                        return null;
                      },

                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Title"
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      maxLines: 5,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Description is required";

                        }
                        return null;
                      },

                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Decription"
                      ),
                    ),
                    const SizedBox(height: 16,),
                    ElevatedButton(onPressed: _addButton, child: const Icon(Icons.arrow_circle_right_outlined)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  void _addButton() {

    if(!_addNewFormKey.currentState!.validate()){
      return;
    }

  }
}
