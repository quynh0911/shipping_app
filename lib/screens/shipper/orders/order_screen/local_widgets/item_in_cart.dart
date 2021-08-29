import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/food_item.dart';

class ItemInCart extends StatefulWidget {
  final String linkavatar;
  final String name;
  final String type;
  final int money;
  final int amount;
  final bool order;
  final bool add;
  const ItemInCart({
    Key? key,
    required this.linkavatar,
    required this.name,
    required this.type,
    required this.money,
    required this.amount,
    required this.order,
    required this.add,
  }) : super(key: key);
  @override
  _ItemInCartState createState() => _ItemInCartState();
}

class _ItemInCartState extends State<ItemInCart> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    return Container(
      margin: (screenWidth > 360)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        maxWidth: 600,
      ),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 40,
                child: widget.order == false
                    ? IconButton(
                        icon: Icon(Icons.add_circle_outline,
                            color: Color.fromRGBO(9, 57, 180, 1)),
                        onPressed: () {},
                      )
                    : Container(),
              ),
              Text(
                widget.amount.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
                width: 40,
                child: widget.order == false
                    ? IconButton(
                        icon: Icon(Icons.remove_circle_outline,
                            color: Color.fromRGBO(9, 57, 180, 1)),
                        onPressed: () {},
                      )
                    : Container(),
              ),
            ],
          ),
          Text(
            screenWidth > 360 ? "   x   " : "  x  ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          FoodItem(
              linkavatar: 'assets/images/tao_pho.jpg',
              name: widget.name,
              type: widget.type,
              money: widget.money,
              add: false),
        ],
      ),
    );
  }
}
