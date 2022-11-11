import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);
  static const String routeName = '/Wishlist';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Wish-List'),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
