import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_admin_app/widgets/products/product_widget.dart';
import 'package:flutter/material.dart';
import '../service/assets_manager.dart';
import '../widgets/app_name_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppNameTextWidget(fontSize: 20),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.card),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                // debugPrint("value of text is $value");
              },
              onSubmitted: (value) {},
              controller: searchTextController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      searchTextController.clear();
                    });
                  },
                  child: const Icon(Icons.clear, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: DynamicHeightGridView(
                itemCount: 200,
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                builder: (context, index) {
                  return const ProductWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
