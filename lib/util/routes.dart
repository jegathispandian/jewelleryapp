import 'package:flutter/material.dart';
import 'package:flutter_play/pages/product_detail_page.dart';
import 'package:flutter_play/util/constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
//    "/productDetail": (BuildContext context) =>
    Constants.ROUTE_PRODUCT_DETAIL: (BuildContext context) =>
        ProductDetailPage(),
  };
}
