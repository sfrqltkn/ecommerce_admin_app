import 'package:ecommerce_admin_app/screen/card/bottom_chechout.dart';
import 'package:ecommerce_admin_app/service/assets_manager.dart';
import 'package:ecommerce_admin_app/screen/card/card_widget.dart';
import 'package:ecommerce_admin_app/screen/card/empty_bag.dart';
import 'package:ecommerce_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.card2,
                title: "Your Cart is empty",
                subtitle: "Like your cart is empty",
                buttonText: "shop Now"),
          )
        : Scaffold(
            bottomSheet: const CardBottomSheetWidget(),
            appBar: AppBar(
              title: const TitleTextWidget(label: "Cart(?)"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_forever_rounded,
                      color: Colors.red),
                ),
              ],
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.bagimg2),
              ),
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CardWidget();
              },
            ),
          );
  }
}
