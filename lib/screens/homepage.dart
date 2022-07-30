import 'package:flutter/material.dart';
import 'package:todoo/screens/taskpage.dart';
import 'package:todoo/widgets/taskcardwidget.dart';
import 'package:todoo/widgets/todowidget.dart';

import '../database/database_helper.dart';
import '../models/task.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero, () async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 32.0, top: 32.0),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 80.0,
                      height: 50.0
                    ),
                  ),
                  Text('Welcome! Ronel', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  initialData: [],
                  future: _dbHelper.getTasks(),
                  builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
                    return ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Taskpage(
                                    task: snapshot.data![index],
                                  ),
                                ),
                              ).then(
                                (value) =>
                                    setState(() {}),
                              );
                            },
                            child: TaskCardWidget(
                              title: snapshot.data ![index].title,
                              description: snapshot.data![index].description,
                              task_remarks: snapshot.data![index].task_remarks,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Taskpage(task: null,)))
              .then((value) => setState(() {}));
        },
        backgroundColor: Color(0xFF7349FE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
