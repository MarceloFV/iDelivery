import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;

  final HomeController controller = Get.find<HomeController>();

  StoreCard({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(store);
    return Card(
      elevation: 0.4,
      child: ListTile(
        onTap: () => controller.onStorePressed(store),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: (store.imgUrl != null) ? Image.network(
            store.imgUrl,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ): Image.asset('assets/images/not-found.jpg',
            height: 60,
            width: 60,
            fit: BoxFit.cover,),
        ),
        title: Text(
          store.title,
          style: GoogleFonts.catamaran(fontSize: 18),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.redAccent,
              size: 13,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              store.phoneNumber, //TODO: Remover isso urgente
              style: GoogleFonts.markaziText(),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              store.shipPrice.toString(),
              style: GoogleFonts.markaziText(fontSize: 16),
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
