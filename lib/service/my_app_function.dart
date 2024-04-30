import 'package:ecommerce_admin_app/service/assets_manager.dart';
import 'package:ecommerce_admin_app/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class MyAppFunction {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required String subtitle,
    bool isError = true,
    required Function fct,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                isError ? AssetsManager.error : AssetsManager.warning,
                height: 60,
                width: 60,
              ),
              const SizedBox(height: 16.0),
              SubTitleTextWidget(label: subtitle, fontWeight: FontWeight.w600),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isError,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const SubTitleTextWidget(
                        label: "Cancel",
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const SubTitleTextWidget(
                      label: "Ok",
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
