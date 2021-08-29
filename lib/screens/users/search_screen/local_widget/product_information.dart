import 'package:flutter/material.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/users/search_screen/view_product.dart';

// Thẻ cửa hàng chứa thông tin cửa hàng chỗ xem món ăn
// Thẻ gồm link avatar, tên, địa chỉ, thời gian mở cửa, , số điện thoại
// biến active là để cho trạng thái hiện số điện thoại, số điện thoại ko hiện đối với user
class ProductInformation extends StatefulWidget {
  late Product product;

  ProductInformation({Key? key, required this.product}) : super(key: key);

  @override
  _ProductInformationState createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
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
    return Container(
      margin: EdgeInsets.only(
        top: 1 + paddingWidth / 10,
        bottom: 1 + paddingWidth / 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.product.actived == true
                ? AppColors.blue
                : AppColors.gray,
            width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width: boundWidth / 40),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(paddingWidth / 10),
                  child: Image.asset(
                    'assets/images/tao_pho.jpg',
                    width: boundWidth / 6,
                    height: boundWidth / 6,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(
                  left: boundWidth / 40,
                  right: boundWidth / 40,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: boundWidth > 400
                                ? boundWidth * 1 / 2
                                : boundWidth * 2 / 5,
                            child: SingleChildScrollView(
                              // for Horizontal view
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: boundWidth * 1 / 25,
                                      height: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.store,
                                        color: AppColors.brown,
                                        size: boundWidth / 20,
                                      ),
                                      Text(
                                        widget.product.store!.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: boundWidth / 30,
                                          height: 1.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: boundWidth * 1 / 12,
                            width: boundWidth * 1 / 6,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ViewProductStart(
                                                product: widget.product)));
                              },
                              child: Text(
                                "Xem",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: boundWidth * 1 / 25,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/clock_red.png",
                            width: boundWidth / 30,
                            height: boundWidth / 30,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            widget.product.store!.openTime +
                                " - " +
                                widget.product.store!.closeTime,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: boundWidth / 30,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              color: AppColors.red,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(
                                top: boundWidth / 80,
                                bottom: boundWidth / 80,
                                left: boundWidth / 50,
                                right: boundWidth / 50),
                            child: Text(
                              widget.product.price.toString() + " đ",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                color: widget.product.actived == true
                                    ? Colors.white
                                    : AppColors.brown,
                                fontSize: boundWidth / 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(boundWidth / 20),
                              color: widget.product.actived == true
                                  ? AppColors.blue
                                  : AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ]),
              )),
            ]),
      ),
    );
  }
}
