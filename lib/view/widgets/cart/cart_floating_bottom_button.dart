import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/colors.dart';

class CartFloatingBottomButton extends StatelessWidget {
  final Function onPressed;
  final String allProductPrice;
  final String amount;
  const CartFloatingBottomButton({
    super.key,
    required this.onPressed,
    required this.allProductPrice,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //! Shipping price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("سعر الشحن", style: TextStyle(fontSize: 15)),
                    Text("\$249.78", style: TextStyle(fontSize: 15)),
                  ],
                ),

                //! price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("سعر المنتجات", style: TextStyle(fontSize: 15)),
                    Text(allProductPrice, style: TextStyle(fontSize: 15)),
                  ],
                ),
                Divider(color: AppColors.mainColor),
                //! Total price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("المجموع", style: TextStyle(fontSize: 15)),
                    Text(amount, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          //! Pay now button
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(20),
            color: AppColors.mainColor,
            onPressed: () {
              onPressed();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "payNow".tr,
                  style: TextStyle(
                    color: TextColors.whiteColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 15),
                Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
