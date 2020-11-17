import 'package:delivery_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:delivery_app/app/modules/layout/views/cart_view.dart';
import 'package:delivery_app/app/modules/layout/views/home_view.dart';
import 'package:delivery_app/app/modules/layout/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutView extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController.value,
          onPageChanged: controller.onPageChanged,
          children: <Widget>[
            HomeView(),
            CartView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          onTap: controller.onItemTapped,
          currentIndex: controller.currentIndex.value,
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({Key key, this.currentIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Carrinho',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
