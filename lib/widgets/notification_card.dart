import 'package:flutter/material.dart';

class NotificationsCard extends StatelessWidget {
  final String status;
  final String time;
  final String content;
  final String reason;
  final Function() delete;
  const NotificationsCard({
    Key?key,
    required this.status,
    required this.time,
    required this.content,
    required this.reason,
    required this.delete
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    double k = (screenWidth > 320) ? 1 : screenWidth/1000*1.5;
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      margin: (screenWidth > 350)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        minWidth: (screenWidth > 600) ? 600 : screenWidth,
        maxHeight: 120,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child : Card(
          child : SizedBox(
            //height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Text(this.status,
                      style: TextStyle(
                        fontSize: (k == 1)?19:16,
                        fontWeight: FontWeight.bold,
                        color:  Color.fromRGBO(29, 67, 155, 1),
                      ),
                    ),
                    Spacer(flex: 9,),
                    Text(this.time,
                      style: TextStyle(
                          fontSize: (k == 1) ? 15 : 15*0.8,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)
                      ),
                    ),
                    Spacer(flex: 1,)
                  ],
                ),
                Spacer(flex: 1,),
                Text(this.content,
                  style: TextStyle(
                      fontSize: (k == 1) ? 15 : 15*0.8,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)
                  ),
                ),
                Spacer(flex: 1,),
                Row(
                  children: <Widget>[
                    Text(this.reason,
                      style: TextStyle(
                          fontSize: (k == 1) ? 15 : 15*0.8,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: this.delete,
                        icon: Icon(Icons.remove_circle))
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}

