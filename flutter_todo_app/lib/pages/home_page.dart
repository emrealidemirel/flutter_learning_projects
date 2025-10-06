// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/local_storage.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/models/task_model.dart';
import 'package:flutter_todo_app/widgets/custom_search_delegate.dart';
import 'package:flutter_todo_app/widgets/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _allTasks;
  late LocalStorage _localStorage;
  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
    _allTasks = <Task>[];
    _getAllTasksFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              _showAddTaskBottomSheet();
            },
            child: Text(
              "title",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ).tr(),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  _showSearchPage();
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  _showAddTaskBottomSheet();
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: _allTasks.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  var _oAnkiListeElemani = _allTasks[index];
                  return Dismissible(
                      background: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("remove_task").tr()
                        ],
                      ),
                      key: Key(_oAnkiListeElemani.id),
                      onDismissed: (direction) {
                        _allTasks.removeAt(index);
                        _localStorage.deleteTask(task: _oAnkiListeElemani);
                        setState(() {});
                      },
                      child: TaskItem(task: _oAnkiListeElemani));
                },
                itemCount: _allTasks.length)
            : Center(
                child: Text("empty_task_list").tr(),
              ));
  }

  void _showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              title: TextField(
                autofocus: true,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: "add_task".tr(), border: InputBorder.none),
                onSubmitted: (value) async {
                  Navigator.of(context).pop();
                  var yeniEklenecekGorev = Task.create(value);
                  _allTasks.insert(0,
                      yeniEklenecekGorev); //_allTasks.add(yeniEklenecekGorev); // Yeni öğenin en başta gözükmesi için değiştirildi
                  await _localStorage.addTask(task: yeniEklenecekGorev);
                  setState(() {});
                },
              ),
            ),
          );
        });
  }

  void _getAllTasksFromDb() async {
    _allTasks = await _localStorage.getAllTask();
    setState(() {});
  }

  void _showSearchPage() async {
    await showSearch(
        context: context, delegate: CustomSearchDelegate(allTasks: _allTasks));
    _getAllTasksFromDb();
  }
}
