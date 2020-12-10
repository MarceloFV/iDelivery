import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:delivery_app/app/modules/home/widgets/home_section.dart';
import 'package:delivery_app/app/modules/home/widgets/store_home_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'O que deseja comer\nhoje?',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.clip,
        ),
        actions: [
          Card(
            elevation: 3,
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              color: Colors.black,
              onPressed: controller.onCartPressed,
            ),
          ),
          Card(
            elevation: 3,
            child: IconButton(
              icon: Icon(
                Icons.exit_to_app,
              ),
              color: Colors.black,
              onPressed: controller.logout,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          // CategorySection(),
          // FavoritesSection(),
          // FeaturesSection(),
          ProductHomeSection(
            products: controller.favoriteProducts,
            icon: Icons.favorite,
            iconBGColor: Colors.red,
            title: "Favoritos",
            subtitle: "Você mais gosta!",
          ),
          StoreHomeSection(
            stores: controller.stores,
            icon: Icons.store,
            iconBGColor: Colors.blue,
            title: "Lanchonetes",
            subtitle: 'Parceiros cadastrados...',
          ),
          // HomeSection(
          //   products: controller.popularProducts,
          //   icon: Icons.star,
          //   iconBGColor: Colors.yellow,
          //   title: "Populares",
          //   subtitle: "A galera curtiu!",
          // ),
        ],
      ),
    );
  }
}
