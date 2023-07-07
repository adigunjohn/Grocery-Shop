import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/shopmodel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModel>(builder: (_,model,child){
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 15.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios_new),),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Text(
                          'My Cart',
                          style:
                          GoogleFonts.montserrat(fontSize: 32),
                        ),
                        SizedBox(height: 15.0,),
                        model.cartListCount == 0 ? Center(child: Text(
                          'No Items in the Cart',
                          style:
                          GoogleFonts.montserrat(fontSize: 22),
                        ),) : Container(
                          height: MediaQuery.of(context).size.height / 1.7,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                  itemCount: model.cartListCount,
                                  itemBuilder: (_,index){
                                var cart = model.cartList[index];
                                return Container(
                                  child: ListTile(
                                    // title: Text('${Provider.of<ShopModel>(context).cartList[index][0]}'),
                                    // subtitle: Text('\$ ${Provider.of<ShopModel>(context).cartList[index][3]}'),
                                    // leading: Image.asset('${Provider.of<ShopModel>(context).cartList[index][1]}'),
                                    title: Text('${Provider.of<ShopModel>(context).cartList[index][0]}'),
                                    subtitle: Text('\$ ${Provider.of<ShopModel>(context).cartList[index][3]}'),
                                    leading: Image.asset('${Provider.of<ShopModel>(context).cartList[index][1]}'),
                                    trailing: IconButton(onPressed: (){
                                      model.removeFromCart(index);
                                    },icon: Icon(Icons.close),),
                                  ),
                                );
                              })),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        model.cartListCount == 0 ? SizedBox() : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Total Price',
                                    style:
                                    GoogleFonts.montserrat(fontSize: 18),
                                  ),
                                  Text(
                                    '\$ ${model.calculateTotalPrice()}',
                                    style:
                                    GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Pay Now',
                                      style:
                                      GoogleFonts.montserrat(fontSize: 18),
                                    ),
                                    Icon(Icons.arrow_forward_ios_rounded)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
