import 'package:ecommerce_admin_app/service/assets_manager.dart';
import 'package:ecommerce_admin_app/screen/card/card_widget.dart';
import 'package:ecommerce_admin_app/screen/card/empty_bag.dart';
import 'package:ecommerce_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const routName = "/WishlistScreenScreen";
  const WishlistScreen({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.arrow_back_ios, size: 20),
              ),
              title: const TitleTextWidget(label: "Wishlist"),
            ),
            body: EmptyBagWidget(
                imagePath: AssetsManager.bagimg7,
                title: "Your Cart is empty",
                subtitle: "Like your Wishlist is empty",
                buttonText: "shop Now"),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.arrow_back_ios, size: 20),
              ),
              title: const TitleTextWidget(label: "Wishlist"),
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
