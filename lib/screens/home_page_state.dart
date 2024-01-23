import 'dart:convert';
import 'package:ecommerceappricoz/cart.dart';
import 'package:ecommerceappricoz/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<ProductModel> productList = [];

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ProductModel>> fetchProducts() async {
    const String url = 'https://dummyjson.com/products';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final mapResponse = json.decode(response.body);

        productList = List<ProductModel>.from(
          mapResponse["products"]
              .map((ele) => ProductModel.fromJson(ele))
              .toList(),
        );
        return productList;
      } else {
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch products');
    }
  }

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  Future<void> initializeData() async {
    try {
      await fetchProducts();
      setState(() {}); // Trigger a rebuild to update the UI
    } catch (error) {
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: InkWell(
                  onTap: () {
                    fetchProducts();
                    print(productList[1].thumbnail);
                  },
                  child: const Text(
                    "Products",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(
                        0xff222222,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  'Super summer sale',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9B9B9B),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyCart(desc: productList[index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                11), // Adjust the border radius
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        productList[index].thumbnail,
                                      ),
                                      fit: BoxFit.fill),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                // width: 171,
                                width: 150,
                                height: 155,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Container(
                                        width: 40,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xFFDB3022)),
                                        child: Center(
                                          child: Text(
                                            '${productList[index].discountPercentage.toInt()}%',
                                            style: GoogleFonts.lato(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 170,
                                height: 155,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [
                                        buildRating(productList[index].rating),
                                
                                        const SizedBox(width: 5),
                                        Text(
                                            '(${productList[index].stock.toInt()})')
                                      ],
                                    ),
                                    Text(
                                      productList[index].brand,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9B9B9B)),
                                    ),
                                    Text(
                                      productList[index].title,
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${productList[index].price.toInt()}\$',
                                          style: const TextStyle(
                                              color: Color(0xff9B9B9B),
                                              fontSize: 14,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${calculateDiscountedPrice(
                                            productList[index].price,
                                            productList[index]
                                                .discountPercentage,
                                          ).toInt()}\$',
                                          style: const TextStyle(
                                            color: Color(0xffDB3022),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRating(double rating) {
    int numberOfFullStars = rating.floor();
    bool hasHalfStar = rating - numberOfFullStars >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < numberOfFullStars; i++)
          const Icon(
            Icons.star,
            color: Color(0xFFFFBA49),
          ),
        if (hasHalfStar)
          const Icon(
            Icons.star_half,
            color: Color(0xFFFFBA49),
          ),
      ],
    );
  }

  double calculateDiscountedPrice(
      double actualPrice, double discountPercentage) {
    if (actualPrice <= 0 ||
        discountPercentage < 0 ||
        discountPercentage > 100) {
      // Invalid input, return the original price
      return actualPrice;
    }

    double discountAmount = (actualPrice * discountPercentage) / 100;
    double discountedPrice = actualPrice - discountAmount;

    return discountedPrice;
  }
}
