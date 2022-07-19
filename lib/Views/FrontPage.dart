import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todov2/Views/AddTaskScreen.dart';
import 'package:todov2/routes/routes.dart';
import '../Controller/controller.dart';

class AddNotesScreen extends StatelessWidget {
  // AddNotesScreen({Key? key}) : super(key: key);
  int index = 0;
  AddNotesScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.put(NoteController());
    Widget getAddNotesScreen() {
      return Obx(
        () => nc.notes.isEmpty
            ? Center(
                child: ClipOval(
                    child: Image.asset(
                  'assets/todo.jpg',
                )),
              )
            : ListView.builder(
                itemCount: nc.notes.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                      title: Text(nc.notes[index].title,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      leading: Text(
                        "${index + 1}.",
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: Wrap(children: <Widget>[
                        IconButton(
                            icon: const Icon(Icons.update),
                            onPressed: () =>
                                Get.to(() => AddTaskScreen(index: index))),
                        IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'Delete Note',
                                  middleText: nc.notes[index].title,
                                  onCancel: () => Get.back(),
                                  confirmTextColor: Colors.white,
                                  onConfirm: () {
                                    nc.notes.removeAt(index);
                                    Get.back();
                                  });
                            })
                      ])),
                ),
              ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'ToDo 2.0',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(() => AddTaskScreen(
                  index: index,
                ));
          },
        ),
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: getAddNotesScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
