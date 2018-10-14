import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../ui-elemnts/tab_bar.dart';
import 'package:flutter_play/pages/product_detail_page.dart';
import 'package:flutter_play/pages/products_list_page.dart';
import 'package:flutter_play/util/routes.dart';
import 'package:flutter_play/widgets/products_list_item.dart';
import '../models/page.dart';

List<Page> _allPages = <Page>[
  Page( text: 'Diamond Bangles', category: 'category-name'),
  Page( text: 'Gold Bangles', category: 'category-name'),
  Page( text: 'Pearl&Diamond Bangles', category: 'category-name'),
  Page( text: 'Stone Bangles', category: 'category-name'),
  Page( text: 'Platinum Diamond Bangles', category: 'category-name'),
  Page(
      text: 'Silvar Bangles',
      category: 'category-name'),
];

class GameTab extends StatefulWidget {
  GameTab({this.scrollController});

  final ScrollController scrollController;

  @override
  _GameTabState createState() => _GameTabState();
}

class _GameTabState extends State<GameTab> with SingleTickerProviderStateMixin {
  TabController _controller;

  Key _key = new PageStorageKey({});
  double _offset = 0.0;

  void _updateScrollPosition() {
    if (widget.scrollController.position.extentAfter == 0.0) {
      setState(() {
        _offset = 25.0;
        if (Platform.isIOS) {
          _offset = 35.0;
        }
      });
    } else if (widget.scrollController.position.extentAfter > 0.0) {
      setState(() {
        _offset = 0.0;
        // Reset scroll positions of the TabBarView pages
        _key = new PageStorageKey({});
      });
    }
  }

  @override
  void initState() {
    _controller = new TabController(vsync: this, length: _allPages.length);
    widget.scrollController.addListener(_updateScrollPosition);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollPosition);
    super.dispose();
  }

buildProductsListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          if (index == 6) {
            return SizedBox(
              height: 12.0,
            );
          }else { 
            return _dummyProductsList()[index];
          }
        },
      ),
    );
  }
/*
  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("SORT"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("REFINE"),
            ],
          ),
        ),
      ),
    );
  }*/

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }

  _dummyProductsList() {
    return [
      ProductsListItem(
        name: "Michael Kora",
        currentPrice: 524,
        originalPrice: 699,
        discount: 25,
        imageUrl:
            "https://content3.jdmagicbox.com/mumbai/c8/022p1218547761q6b7c8/catalogue/asmi-jewellery-india-ltd-corporate-office-andheri-east-mumbai-corporate-companies-qmbnk.jpg",
      ),
      ProductsListItem(
        name: "Michael Kora",
        currentPrice: 524,
        originalPrice: 699,
        discount: 25,
        imageUrl:
            "https://sn.joharishop.com/images/product-images/candere_thumb/gr00103_3.jpg",
      ),
      ProductsListItem(
        name: "David Klin",
        currentPrice: 249,
        originalPrice: 499,
        discount: 50,
        imageUrl:
            "https://images-na.ssl-images-amazon.com/images/I/71G2I4UBV4L._UY500_.jpg",
      ),
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 899,
        originalPrice: 1299,
        discount: 23,
        imageUrl:
            "https://res.cloudinary.com/glamira/image/upload/c_limit,c_fill,dpr_1.0,f_auto,fl_lossy,q_auto/media/product/set55/melora/white_red_diamond_1.jpg",
      ),
      ProductsListItem(
        name: "David Klin",
        currentPrice: 249,
        originalPrice: 499,
        discount: 20,
        imageUrl:
            "https://images-eu.ssl-images-amazon.com/images/I/41+tRCXENpL._AC_UL260_SR200,260_FMwebp_QL70_.jpg",
      ),
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 899,
        originalPrice: 1299,
        discount: 23,
        imageUrl:
            "https://rukminim1.flixcart.com/image/300/300/pendant-locket/p/h/c/odlpt00006dg-fxy41-wearyourshine-by-pcj-original-imae4mm6nzyyafcq.jpeg?q=90",
      ),
    ];
  }

  Widget build(BuildContext context) {
     final List<Widget> tabChildernPages = <Widget>[];
     _allPages.forEach((Page page) => tabChildernPages.add(buildProductsListPage())); 

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: _offset),
          decoration: BoxDecoration(color: Colors.green),
        ),
        TabBarWidget(_controller, _allPages),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: TabBarView(
              key: _key,
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: tabChildernPages,
            ),
          ),
        ),
      ],
    );
  }
}
