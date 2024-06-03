// import 'package:dokan/main.dart';
// import 'package:dokan/widget/my_colors.dart';
// import 'package:flutter/material.dart';

// class ItemWidget extends StatelessWidget {
//   const ItemWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: GridView.count(
//         padding: EdgeInsets.only(left: 12),
//         childAspectRatio: 0.68,
//         physics: NeverScrollableScrollPhysics(),
//         crossAxisCount: 2,
//         shrinkWrap: true,
//         children: [
//          for(int i = 1; i<8;i++)
//           Container(
//             padding: EdgeInsets.only(left: 0, right: 15, top: 5),
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     margin: EdgeInsets.all(10),
//                     child: Image.asset('assets/images/$i.png'),
//                     height: 125,
//                     width: 125,
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "  Write description",
//                     style: TextStyle(fontSize: 15, color: MyColors().blackColor),
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         '\$100',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: MyColors().font,
//                           decoration:
//                               TextDecoration.lineThrough, // Apply strike-through
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         '\$90',
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: MyColors().blackColor),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 8),
//                   alignment: Alignment.centerLeft,
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:dokan/main.dart';
import 'package:dokan/widget/my_colors.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String imagePath;
  final String description;
  final double originalPrice;
  final double discountedPrice;
  final int rating;

  const ItemWidget({
    Key? key,
    required this.imagePath,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(left: 8),
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children:  [
        for (int i = 0; i<2;i++)
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                 
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(imagePath),
                  height: 125,
                  width: 125,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  description,
                  style: TextStyle(
                      fontSize: 18,
                      color: MyColors().blackColor,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '\$$originalPrice',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyColors().font,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '\$$discountedPrice',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: MyColors().blackColor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: List.generate(
                      rating,
                      (index) => const Icon(
                        Icons.star,
                        color: Color.fromRGBO(245, 166, 35, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
