import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {

  final String? title;
  final String? description;
  final String? task_remarks;
  const TaskCardWidget({ this.title,this.description, this.task_remarks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Unnamed Task)",
            style: TextStyle(
                color: Color(0xFF211551),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              description ?? "(Unnamed Description)",
              style: TextStyle(
                  fontSize: 16.0, color: Color(0xFF868290), height: 1.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(task_remarks ?? "",
                  style: TextStyle(
                      fontSize: 16.0, color: Color(0xFF868290), height: 1.5),
                ),
                InkWell(
                  onTap: () {

                  },
                  child:Icon(Icons.delete,color: Colors.pink[500],) ,
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
