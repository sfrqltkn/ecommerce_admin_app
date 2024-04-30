import 'package:ecommerce_admin_app/service/assets_manager.dart';
import 'package:ecommerce_admin_app/screen/card/card_widget.dart';
import 'package:ecommerce_admin_app/screen/card/empty_bag.dart';
import 'package:ecommerce_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";
  const ViewedRecentlyScreen({super.key});

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
              title: const TitleTextWidget(label: "Viewed Recently"),
            ),
            body: EmptyBagWidget(
                imagePath: AssetsManager.searchrecent,
                title: "Your Cart is empty",
                subtitle: "Like your Viewed Recentlyis empty",
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
              title: const TitleTextWidget(label: "Viewed Recently"),
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
