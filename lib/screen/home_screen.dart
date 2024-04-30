import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_admin_app/constant/app_constans.dart';
import 'package:ecommerce_admin_app/widgets/products/category_rounded_widget.dart';
import 'package:ecommerce_admin_app/widgets/products/top_products.dart';
import 'package:ecommerce_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';
import '../service/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.card),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  child: Swiper(
                    itemCount: AppConstans.bannerImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        AppConstans.bannerImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.red,
                        color: Colors.green,
                      ),
                      margin: EdgeInsets.all(5.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const TitleTextWidget(label: "Top Product"),
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const TopProductWidget();
                  },
                ),
              ),
              const TitleTextWidget(label: "Categories"),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  AppConstans.categoriesList.length,
                  (index) {
                    return CategoryRoundedWidget(
                      image: AppConstans.categoriesList[index].image,
                      name: AppConstans.categoriesList[index].name,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
