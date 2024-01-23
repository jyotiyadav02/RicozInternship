// import 'package:ecommerceappricoz/model/api_model.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MyCart extends StatefulWidget {
//   final ProductModel desc;

//   const MyCart({Key? key, required this.desc}) : super(key: key);

//   @override
//   State<MyCart> createState() => _MyCartState();
// }

// class _MyCartState extends State<MyCart> {
//   bool isLiked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           widget.desc.title,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 400,
//             child: Stack(
//               children: [
//                 ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: widget.desc.images.length,
//                   itemBuilder: (context, imageIndex) {
//                     return SizedBox(
//                       width: 275,
//                       height: 56,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           width: 275,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image:
//                                   NetworkImage(widget.desc.images[imageIndex]),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 Positioned(
//                   top: 20,
//                   right: 10,
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isLiked = !isLiked;
//                       });
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: isLiked
//                             ? Colors.red // Color when item is liked
//                             : const Color.fromARGB(255, 250, 248, 248), // Color when item is not liked
//                       ),
//                       child: Icon(
//                         // Icons.favorite,
//                         //  const Color.fromARGB(255, 250, 248, 248),
//                         Icons.favorite_outline_outlined,
//                         // color: Color.fromARGB(99, 15, 15, 15),
//                        color: isLiked
//                             ?const Color.fromARGB(255, 250, 248, 248) // Color when item is liked
//                             :Color.fromARGB(99, 15, 15, 15), // Color when item is not liked

//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 16, top: 16),
//                   child: Text(
//                     widget.desc.title,
//                     style: const TextStyle(
//                         fontSize: 24, fontWeight: FontWeight.w900),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Text(
//                   '\$${calculateDiscountedPrice(
//                     widget.desc.price,
//                     widget.desc.discountPercentage,
//                   ).toInt()}',
//                   style: const TextStyle(
//                       fontSize: 24, fontWeight: FontWeight.w900),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 16,
//             ),
//             child: Text(
//               widget.desc.category,
//               style: const TextStyle(
//                   color: Color(0xff9B9B9B),
//                   fontSize: 11,
//                   fontWeight: FontWeight.w400),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 16, top: 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 buildRating(4.5),
//                 const SizedBox(width: 5),
//                 Text('(${widget.desc.stock.toInt()})')
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(left: 16, top: 10),
//             width: 343,
//             child: Text(
//               widget.desc.description,
//               style: GoogleFonts.lato(
//                 color: Colors.black,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           const Spacer(),
//           const Divider(
//             height: 6,
//             color: Color.fromARGB(255, 192, 189, 189),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               width: 343,
//               child: TextButton(
//                 onPressed: () {
//                   print('TextButton pressed!');
//                 },
//                 style: TextButton.styleFrom(
//                   backgroundColor: const Color(0xffDB3022),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 20.0, horizontal: 16.0),
//                   shape: const StadiumBorder(),
//                 ),
//                 child: const Text(
//                   'ADD TO CART',
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 5)
//         ],
//       ),
//     );
//   }

//   Widget buildRating(double rating) {
//     int numberOfFullStars = rating.floor();
//     bool hasHalfStar = rating - numberOfFullStars >= 0.5;

//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         for (int i = 0; i < numberOfFullStars; i++)
//           const Icon(
//             Icons.star,
//             color: Color(0xFFFFBA49),
//           ),
//         if (hasHalfStar)
//           const Icon(
//             Icons.star_half,
//             color: Color(0xFFFFBA49),
//           ),
//       ],
//     );
//   }

//   double calculateDiscountedPrice(
//       double actualPrice, double discountPercentage) {
//     if (actualPrice <= 0 ||
//         discountPercentage < 0 ||
//         discountPercentage > 100) {
//       // Invalid input, return the original price
//       return actualPrice;
//     }

//     double discountAmount = (actualPrice * discountPercentage) / 100;
//     double discountedPrice = actualPrice - discountAmount;

//     return discountedPrice;
//   }
// }

import 'package:ecommerceappricoz/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatefulWidget {
  final ProductModel desc;

  const MyCart({Key? key, required this.desc}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.desc.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            child: Stack(
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.desc.images.length,
                  itemBuilder: (context, imageIndex) {
                    return SizedBox(
                      width: 275,
                      height: 56,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 275,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(widget.desc.images[imageIndex]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isLiked
                            ? Colors.red // Color when item is liked
                            : const Color.fromARGB(255, 250, 248, 248), // Color when item is not liked
                      ),
                      child: Icon(
                        Icons.favorite_outline_outlined,
                        color: isLiked
                            ? const Color.fromARGB(255, 250, 248, 248) // Color when item is liked
                            : Color.fromARGB(99, 15, 15, 15), // Color when item is not liked
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    widget.desc.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '\$${calculateDiscountedPrice(
                    widget.desc.price,
                    widget.desc.discountPercentage,
                  ).toInt()}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              widget.desc.category,
              style: const TextStyle(
                  color: Color(0xff9B9B9B),
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildRating(widget.desc.rating), // Pass the rating from ProductModel
                const SizedBox(width: 5),
                Text('(${widget.desc.stock.toInt()})')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, top: 10),
            width: 343,
            child: Text(
              widget.desc.description,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(),
          const Divider(
            height: 6,
            color: Color.fromARGB(255, 192, 189, 189),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 343,
              child: TextButton(
                onPressed: () {
                  print('TextButton pressed!');
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffDB3022),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16.0),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'ADD TO CART',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5)
        ],
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
 