import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/widgets/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _firestore = FirebaseFirestore.instance;

class BuyingScreen extends StatefulWidget {
  const BuyingScreen({
    Key? key,
    required this.productName,
    required this.productQuantity,
    required this.productPackaging,
    required this.productPrice,
    required this.productRating,
    required this.storeName,
    required this.imageUrl,
    required this.productStock,
  }) : super(key: key);
  static const String id = 'BuyingScreen';
  final String productName;
  final String productQuantity;
  final String productPackaging;
  final int productPrice;
  final int productRating;
  final String storeName;
  final String imageUrl;
  final int productStock;

  @override
  _BuyingScreenState createState() => _BuyingScreenState();
}

class _BuyingScreenState extends State<BuyingScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: kDarkPurple,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.arrow_back,
                      color: kWhite,
                    ),
                  ),
                ),
                Text(
                  '${widget.productName}, ${widget.productQuantity} -\n${widget.productPackaging}',
                  style: kHeadingTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kWhite,
                  ),
                  child: Image(
                    image: NetworkImage(widget.imageUrl),
                    width: 280,
                    height: 210,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ ${widget.productPrice}/${widget.productQuantity}',
                      style: const TextStyle(
                        color: kWhite,
                        fontFamily: 'Oxygen',
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sold by: ${widget.storeName}',
                  style: const TextStyle(
                    color: kWhite,
                    fontFamily: 'Oxygen',
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity -= 1;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: kDarkPurple,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      color: kWhite,
                      height: 30,
                      width: 60,
                      padding: EdgeInsets.zero,
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            color: kDarkPurple,
                            fontSize: 20,
                            fontFamily: 'Oxygen',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (quantity < widget.productStock) {
                              quantity += 1;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: kDarkPurple,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Quantity',
                      style: TextStyle(
                        fontFamily: 'Oxygen',
                        color: kWhite,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kWhite),
                      child: const Center(
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            color: kDarkPurple,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily: 'Oxygen',
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _firestore.collection('cart_items').add({
                          'email': 'aadil@hyperlocal.com',
                          'storeName': widget.storeName,
                          'buyingQuantity': quantity,
                          'productName': widget.productName,
                          'productPackaging': widget.productPackaging,
                          'productQuantity': widget.productQuantity,
                          'productPrice': widget.productPrice,
                          'image': widget.imageUrl,
                        });
                        Alert(
                          context: context,
                          desc: "Added to cart.",
                          buttons: [
                            DialogButton(
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                              color: kDarkPurple,
                            )
                          ],
                        ).show();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kDarkPurple,
                            border: Border.all(color: kWhite, width: 2)),
                        child: const Center(
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: 'Oxygen',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NewNavBar(),
      ),
    );
  }
}
