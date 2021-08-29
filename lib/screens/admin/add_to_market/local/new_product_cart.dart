import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/providers/add_to_market_provider/type_new_product_info.dart';

class NewProductCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewProductCart();
  }
}

class _NewProductCart extends State<NewProductCart> {
  @override
  Widget build(BuildContext context) {
    final TypeNewProductInfo typeNewProductInfo =
        context.watch<TypeNewProductInfo>();
    return Container(
      width: 300,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Container(
              child: _image != null
                  ? Image.network(
                      _image!.path,
                    )
                  : Image.asset('assets/images/tao_pho.jpg'),
              width: 100,
              height: 100,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        //color: Colors.pink,
                        alignment: Alignment.topCenter,
                        child: Text(
                          typeNewProductInfo.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                  ),
                  Expanded(
                      child: Container(
                          constraints: const BoxConstraints(
                            maxHeight: double.infinity,
                          ),
                          alignment: Alignment.center,
                          child: Text(typeNewProductInfo.price.toString() +
                              '/' +
                              typeNewProductInfo.unit))),
                  Container(
                      height: 20,
                      padding: EdgeInsets.only(bottom: 5),
                      child: ButtonTheme(
                          child: TextButton(
                        child: Text('Thêm ảnh'),
                        onPressed: () {
                          _showPicker(context);
                        },
                      )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  XFile? _image;

  _imgFromCamera() async {
    final _picker = ImagePicker();
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
