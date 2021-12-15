import 'package:flutter/material.dart';
import 'package:shopping_getx_flutter/constants/text_styles.dart';

class ProductDetailsScreen extends StatelessWidget {

  final String title;
  final double price;
  final String image;
  final String description;

  ProductDetailsScreen(this.title, this.price, this.image, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF6F6F6),
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Chip(
                      label: Text(
                        "Price: " "USD " + price.toString(),
                        textAlign: TextAlign.center,
                        style: textButtonWhite,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "" + description,
                      textAlign: TextAlign.center,
                      style: textDescription,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}