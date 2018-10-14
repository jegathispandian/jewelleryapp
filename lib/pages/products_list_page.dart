import 'package:flutter/material.dart';
import 'package:flutter_play/widgets/products_list_item.dart';

class ProductsListPage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "JEWELLERY LIST",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildProductsListPage(),
    );
  }

  _buildProductsListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
         if (index == 0) {
            return _buildFilterWidgets(screenSize);
          } else if (index == 6) {
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
  }

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
}
