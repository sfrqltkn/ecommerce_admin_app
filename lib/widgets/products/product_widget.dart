import 'package:ecommerce_admin_app/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        debugPrint("to do add navigate");
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: FancyShimmerImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1465572089651-8fde36c892dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
              height: size.height * 0.25,
              width: size.height * 0.25,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                const Flexible(
                  flex: 5,
                  child: TitleTextWidget(
                    label: "Title",
                    fontSize: 18,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.heart),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 1,
                  child: SubTitleTextWidget(
                    label: "150.00\$",
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Material(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.red,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {},
                      splashColor: Colors.grey,
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.add_shopping_cart_outlined),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
