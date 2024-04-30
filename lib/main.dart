import 'package:ecommerce_admin_app/constant/theme_data.dart';
import 'package:ecommerce_admin_app/providers/theme_provider.dart';
import 'package:ecommerce_admin_app/root_screen.dart';
import 'package:ecommerce_admin_app/screen/init_screen/viewed_recently.dart';
import 'package:ecommerce_admin_app/screen/init_screen/wishlist.dart';
import 'package:ecommerce_admin_app/widgets/products/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Eccommer App',
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            home: const RootScreen(),
            routes: {
              ProductDetailScreen.routName: (context) =>
                  const ProductDetailScreen(),
              WishlistScreen.routName: (context) => const WishlistScreen(),
              ViewedRecentlyScreen.routName: (context) =>
                  const ViewedRecentlyScreen(),
            },
          );
        },
      ),
    );
  }
}
