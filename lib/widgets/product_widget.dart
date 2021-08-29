import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/screens/users/search_screen/view_product.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  late Product product;
  ProductWidget({Key? key, required Product product}) {
    this.product = product;
  }
  @override
  _ProductWidgetState createState() {
    return _ProductWidgetState();
  }
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 0.9;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 0.95;
    else
      boundWidth = screenWidth * 0.7;
    double paddingWidth = (screenWidth - boundWidth) / 2;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewProductStart(product: widget.product)),
        );
      },
      child: Container(
        width: boundWidth / 4,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: boundWidth * 0.225,
              height: boundWidth * 0.2,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Image.asset(
                widget.product.image!,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: boundWidth * 0.2,
              child: Text(
                widget.product.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: AppColors.brown,
                  fontSize: boundWidth / 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(boundWidth / 80),
              child: Text(
                "${widget.product.price.toString()}đ",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: boundWidth / 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              width: boundWidth * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(boundWidth / 20),
                color: AppColors.pantanoBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
