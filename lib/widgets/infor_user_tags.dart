import 'package:flutter/material.dart';

class InfoUserCard extends StatelessWidget {

  final String customer;
  final String phone;
  final String address;
  final Function() edit;
  const InfoUserCard({
    Key? key,
    required this.customer,
    required this.phone,
    required this.address,
    required this.edit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
        padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
        child: Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.indigo, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      this.customer,
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: this.edit,
                        child: Text(
                          'Chỉnh sửa  ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      this.phone,
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      this.address,
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }
}
