import 'package:flutter/material.dart';
import 'package:todoo/database/database_helper.dart';
class TodoWidget extends StatelessWidget {

  DatabaseHelper _dbHelper = DatabaseHelper();
  final int id;
  final String? text;
  final bool isDone;

  TodoWidget({required this.id, this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 12.0
            ),
            decoration: BoxDecoration(
              color: isDone ? Color(0xFF7349FE) : Colors.transparent,
              borderRadius: BorderRadius.circular(6.0),
              border: isDone ? null : Border.all(
                color: Color(0xFF868290),
                width: 1.5,
              )
            ),
            child:Image(
              image: AssetImage('assets/images/check_icon.png'),
            ) ,
          ),
          Expanded(
            child: TextField(
              controller: TextEditingController()..text = text ?? "",
                onSubmitted: (value) async {
                  if(value != ""){
                    if(id != 0){
                      await _dbHelper.updateTodoNote(id!, value);
                    }
                  }
                },
              decoration: InputDecoration(
                hintText: "Enter Todo item...",
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: isDone ? Color(0xFF86829D) : Color(0xFF211551) ,
                fontSize: 16.0,
                fontWeight:isDone ? FontWeight.normal : FontWeight.bold,
                decoration: isDone ? TextDecoration.lineThrough : null,
              )
            ),
          )
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
