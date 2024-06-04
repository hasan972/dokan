import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:dokan/UI/myProfile.dart';
import 'package:dokan/data/product_data.dart';
import 'package:dokan/model/product_model.dart';
import 'package:dokan/widget/Item_widget.dart';
import 'package:dokan/widget/my_colors.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // List<Product> itemsList = productFromJson(data);
  int selectedIndex = 2;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 229, 229, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(232, 229, 229, 1),
        automaticallyImplyLeading: false,
        title: const Text(
          'Product List',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(34, 36, 85, 1),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: MyColors().white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          constraints: BoxConstraints.tight(
                              const Size(double.maxFinite, 900)),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: MyColors().white,
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '   Filter',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  ChecklistItem(text: 'Newest'),
                                  ChecklistItem(text: 'Oldest'),
                                  ChecklistItem(text: 'Price low > High'),
                                  ChecklistItem(text: 'Price High > Low'),
                                  ChecklistItem(text: 'Best Selling'),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(155.5, 61),
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                              width: 0.69,
                                              color: Colors.black,
                                            ),
                                          ),
                                          elevation: 0,
                                          primary: Colors.white,
                                          onPrimary: Colors.transparent,
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: MyColors().font,
                                              fontSize: 17),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(155.5, 61),
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                              width: 0.69,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          elevation: 0,
                                          primary: MyColors().applyButton,
                                          onPrimary: MyColors().white,
                                        ),
                                        child: Text(
                                          'Apply',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.tune,
                            color: MyColors().font,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Filter',
                            style: TextStyle(color: MyColors().font),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('Sort by',
                            style: TextStyle(color: MyColors().font)),
                        DropdownButton<String>(
                          onChanged: (value) {},
                          items: <String>[
                            'Newest',
                            'Oldest',
                            'Price Low>High',
                            'Price High>Low',
                          ].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: MyColors().font),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.list_outlined,
                          color: MyColors().blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ItemWidget(
              imagePath: 'assets/images/2.png',
              description:
                  'Water-resistant, Heart Rate Monitor, GPS, Bluetooth 5.0, Fitness Tracker, OLED Display',
              originalPrice: 100,
              discountedPrice: 90,
              rating: 5,
            ),
            ItemWidget(
              imagePath: 'assets/images/4.png',
              description:
                  ' Heart Rate Monitor, GPS, Bluetooth 5.0, Fitness Tracker, OLED Display',
              originalPrice: 110,
              discountedPrice: 100,
              rating: 4,
            ),
            ItemWidget(
              imagePath: 'assets/images/3.png',
              description:
                  'Leather, Crossbody, Zip Closure, Interior Pockets, Adjustable Strap, Designer Logo',
              originalPrice: 200,
              discountedPrice: 250,
              rating: 3,
            ),
            const ItemWidget(
              imagePath: 'assets/images/1.png',
              description:
                  'Leather, Crossbody, Zip Closure, Interior Pockets, Adjustable Strap, Designer Logo',
              originalPrice: 150,
              discountedPrice: 160,
              rating: 5,
            ),
            const ItemWidget(
              imagePath: 'assets/images/1.png',
              description:
                  'Water-resistant, Heart Rate Monitor, GPS, Bluetooth 5.0, Fitness Tracker, OLED Display',
              originalPrice: 110,
              discountedPrice: 100,
              rating: 5,
            ),
            const ItemWidget(
              imagePath: 'assets/images/3.png',
              description:
                  'Leather, Crossbody, Zip Closure, Interior Pockets, Adjustable Strap, Designer Logo',
              originalPrice: 110,
              discountedPrice: 100,
              rating: 5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromRGBO(232, 229, 229, 1),
        buttonBackgroundColor: MyColors().mainColor,
        color: MyColors().white,
        index: selectedIndex,
        height: 60,
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              color: selectedIndex == 0
                  ? Colors.white
                  : Color.fromRGBO(110, 127, 170, 1),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.border_all,
              color: selectedIndex == 1
                  ? Colors.white
                  : Color.fromRGBO(110, 127, 170, 1),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.search,
              color: selectedIndex == 2
                  ? Colors.white
                  : Color.fromRGBO(110, 127, 170, 1),
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.shopping_cart,
              color: selectedIndex == 3
                  ? Colors.white
                  : Color.fromRGBO(110, 127, 170, 1),
            ),
          ),
          CurvedNavigationBarItem(
            child: GestureDetector(
              onTap: () {
                if (selectedIndex == 4) {
                  setState(() {
                    selectedIndex = 4;
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfile()),
                  );
                }
              },
              child: Icon(
                Icons.person,
                color: selectedIndex == 4
                    ? Colors.white
                    : Color.fromRGBO(110, 127, 170, 1),
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
//================Check List Part=================//

class ChecklistItem extends StatefulWidget {
  final String text;

  const ChecklistItem({Key? key, required this.text}) : super(key: key);

  @override
  _ChecklistItemState createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return MyColors().checklist;
            }

            return MyColors().white;
          }),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.text,
          style:
              const TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 1)),
        ),
      ],
    );
  }
}
