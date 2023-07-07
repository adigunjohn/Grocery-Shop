import 'package:flutter/material.dart';
import 'package:grocery_shop/cartscreen.dart';
import 'package:grocery_shop/grocerywidget.dart';
import 'package:grocery_shop/shopmodel.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModel>(builder: (_, model, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> CartScreen()));
        },child: Icon(Icons.shopping_cart),),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 15.0, left: 10.0, right: 10.0),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning,',
                            style:
                            GoogleFonts.montserrat(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            'Let\'s order something fresh for you',
                            style:
                            GoogleFonts.montserrat(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Divider(color: Colors.grey,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Fresh Items',
                              style:
                              GoogleFonts.montserrat(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1/1.3,
                            crossAxisCount: 2),
                        itemCount: model.groceryListCount,
                        itemBuilder: (context, index) {
                         var grocery = model.groceryList[index];
                          return GroceryCard(
                            // groceryName: grocery.groceryName,
                            // groceryColor: grocery.groceryColor,
                            // groceryPicture: grocery.groceryPicture,
                            // groceryPrice: grocery.groceryPrice,
                            groceryName: grocery[0],
                            groceryPrice: grocery[3],
                            groceryPicture: grocery[1],
                            groceryColor: grocery[2],
                            onPressed: (){
                              model.addToCart(index);
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
