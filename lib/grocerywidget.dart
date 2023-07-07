import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/cartscreen.dart';

class GroceryCard extends StatelessWidget {
   GroceryCard({
      required this.groceryName,
      required this.groceryPicture, this.groceryColor,
      required this.groceryPrice, this.onPressed});
  final String? groceryName;
  final int? groceryPrice;
  final String? groceryPicture;
  final Color? groceryColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: groceryColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(groceryPicture.toString(), scale: 10,),
            Text(
              groceryName.toString(),
              style: GoogleFonts.poppins(fontSize: 12),
            ),
            MaterialButton(
              color: Colors.black54,
              onPressed: onPressed,
              child: Text(
                '\$ ${groceryPrice}',
                style:
                    GoogleFonts.montserrat(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class GroceryCardd {
//   String? groceryName;
//   int? groceryPrice;
//   String? groceryPicture;
//   Color? groceryColor;
//   GroceryCardd(
//       {required this.groceryName,
//       required this.groceryPicture,
//       this.groceryColor,
//       required this.groceryPrice});
// }
