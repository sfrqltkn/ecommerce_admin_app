import 'package:ecommerce_admin_app/providers/theme_provider.dart';
import 'package:ecommerce_admin_app/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(fontSize: 20),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.card),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Kullanıcı Giriş Uyarısı
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TitleTextWidget(label: "label"),
            ),
          ),
          Visibility(
            visible: true,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 3,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AssetsManager.computer,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(label: "Sefer Can"),
                        SizedBox(height: 5),
                        SubTitleTextWidget(label: "Coding sfrgltkn@gmail.com"),
                      ],
                    ),
                  ],
                )),
          ),

          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              const TitleTextWidget(label: "Information"),
              const SizedBox(height: 10),
              CustomListTile(
                imagePath: AssetsManager.bagimg2,
                function: () {},
                text: "All Orders",
              ),
              CustomListTile(
                imagePath: AssetsManager.bagimg1,
                function: () {},
                text: "Favori",
              ),
              CustomListTile(
                imagePath: AssetsManager.clock,
                function: () {},
                text: "View Recently",
              ),
              CustomListTile(
                imagePath: AssetsManager.location,
                function: () {},
                text: "Address",
              ),
              const Divider(thickness: 1),
              CustomListTile(
                imagePath: AssetsManager.privacy,
                function: () {},
                text: "Settings",
              ),
              const SizedBox(height: 10),
              SwitchListTile(
                title: Text(
                    themeProvider.getIsDarkTheme ? "Dark Mode" : "Light Mode"),
                value: themeProvider.getIsDarkTheme,
                onChanged: (value) {
                  themeProvider.setDarkTheme(themeValue: value);
                },
              ),
              const SizedBox(height: 0),
            ],
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              label: const Text("Login"),
              icon: const Icon(Icons.login),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.function,
    required this.text,
  });

  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubTitleTextWidget(label: text),
      leading: Image.asset(imagePath, height: 34),
      trailing: const Icon(CupertinoIcons.chevron_right),
    );
  }
}
