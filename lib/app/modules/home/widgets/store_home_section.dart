import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/modules/home/widgets/store_card.dart';
import 'package:delivery_app/app/modules/home/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Provavelmente vai bugar tudo
class StoreHomeSection extends StatelessWidget {
  final RxList<StoreModel> stores;
  final Function onTap;
  final IconData icon;
  final Color iconBGColor;
  final String title;
  final String subtitle;
  final bool showList;

  const StoreHomeSection({
    Key key,
    this.stores,
    this.icon = Icons.star,
    this.onTap,
    this.iconBGColor = Colors.blue,
    this.title = '',
    this.subtitle = '',
    this.showList = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopicCard(
          onTap: onTap,
          topicItem: TopicItem(
            Container(
              child: Icon(
                icon,
                color: Colors.white,
              ),
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: iconBGColor,
              ),
            ),
            title,
            subtitle,
          ),
        ),
        showList
            ? Obx(
                () => Column(
                    children: stores
                        .map(
                          (StoreModel store) => StoreCard(
                            store: store,
                          ),
                        )
                        .toList()),
              )
            : Container(),
      ],
    );
  }
}
