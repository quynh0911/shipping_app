import 'package:flutter/material.dart';
import 'package:flutter_application/models/order.dart';

class StateFullHistory extends StatefulWidget {
  StateFullHistory({Key? key, required this.type, required this.order})
      : super(key: key);
  final String type;
  final Order order;
  bool cancel = false;
  @override
  _StateFullHistoryState createState() => _StateFullHistoryState();
}

class _StateFullHistoryState extends State<StateFullHistory> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 500) ? 500 : screenWidth;
    return Container(
      margin: EdgeInsets.only(top: 10, left: 36, right: 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              (widget.type == "Đơn hàng" || widget.type == "Đi chợ")
                  ? "Số món: " + widget.order.items.length.toString()
                  : "",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Spacer(),
            Text(
              "Thành tiền: " + widget.order.totalPrice.toString() + "đ",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Trạng thái: " + widget.order.orderState,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Spacer(),
            Text(
              widget.order.orderState == "Hoàn thành"
                  ? "12:30:30 31/07/2021"
                  : "",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Text(
          widget.order.shipper == null
              ? "Người vận chuyển: chưa có"
              : "Người vận chuyển: " +
                  widget.order.shipper!.login +
                  " " +
                  widget.order.shipper!.login,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.order.shipper == null
                  ? "Số điện thoại: chưa có"
                  : "Số điện thoại: " + widget.order.shipper!.login,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: widget.order.orderState == "Chờ xác nhận"
                  ? () {
                      widget.cancel = true;
                      setState(() {});
                    }
                  : widget.order.orderState == "Tìm tài xế"
                      ? () {}
                      : () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      widget.order.orderState != "Tìm tài xế"
                          ? Color.fromRGBO(9, 57, 180, 1)
                          : Color.fromRGBO(135, 123, 123, 0.3))),
              child: Container(
                width: (screenWidth < 300) ? 44 : 60,
                height: 24,
                alignment: Alignment.center,
                child: Text(
                  widget.order.orderState == "Hoàn thành"
                      ? "Xóa"
                      : widget.order.orderState == "Đang giao"
                          ? "Gọi"
                          : "Hủy",
                  style: TextStyle(
                    color: widget.order.orderState != "Tìm tài xế"
                        ? Color.fromRGBO(255, 240, 0, 1)
                        : Color.fromRGBO(135, 123, 123, 0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            widget.cancel == true
                ? Container(
                    width: 200,
                    height: 40,
                    padding: new EdgeInsets.only(top: 8.0, right: 5.0),
                    child: new TextField(
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      controller: null,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          padding: EdgeInsets.only(bottom: 1.0),
                          icon: Icon(Icons.send,
                              color: Color.fromRGBO(9, 57, 180, 1)),
                          onPressed: () {},
                        ),
                        isDense: true,
                        hintText: 'Lý do hủy ...',
                        fillColor: Colors.black,
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Container(
          margin:
              EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 20.0),
          width: cardWidth * 1,
          height: 4,
          decoration: BoxDecoration(
            color: Color.fromRGBO(9, 57, 180, 1),
          ),
        ),
      ]),
    );
  }
}
