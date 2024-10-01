import 'package:azedenstore/app/helper/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _progress = 0.0;
  late InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        }

        HelperFunctions.showConfirmationBottomSheet(
          context,
          onPressed1: () {
            // Exit the app
            SystemNavigator.pop();
          },
          onPressed2: () {
            Navigator.of(context).pop();
          },
          icon1: Icons.check,
          icon2: Icons.close,
          title1: 'YES',
          title2: 'NO',
          message: 'Are you sure you want to exit?',
        );

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest:
                    URLRequest(url: WebUri("https://www.azedenstore.com")),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    useOnDownloadStart: true,
                    useShouldInterceptAjaxRequest: true,
                    useShouldInterceptFetchRequest: true,
                  ),
                ),
                onProgressChanged: (controller, progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
              if (_progress < 1.0)
                LinearProgressIndicator(
                  value: _progress,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  backgroundColor: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
