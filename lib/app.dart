import 'package:eccomerce_app/page/buttom_page.dart';
import 'package:flutter/material.dart';

import 'E_commerce_fakestore_api/Page/catagory_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false
      ),
      home: BottomPage(),
    );
  }
}
