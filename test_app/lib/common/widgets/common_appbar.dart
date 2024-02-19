import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppBar(
      {Key? key,
      required this.title,
      this.isFavouriteNeeded,
      required this.onLeftActionTap,
      required this.onNotificationTap,
      this.cartCount})
      : super(key: key);

  final String title;
  final Function() onLeftActionTap;
  final Function() onNotificationTap;
  bool? isFavouriteNeeded;
  final int? cartCount;
  @override
  Size get preferredSize => const Size.fromHeight(25);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
          ),
          Row(
            children: [
              InkWell(
                onTap: onLeftActionTap,
                child: Icon(
                  (isFavouriteNeeded ?? false)
                      ? Icons.favorite
                      : Icons.notifications_active,
                ),
              ),
              InkWell(
                  onTap: onNotificationTap,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child:  Stack(
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Center(
                              child: Text(
                                (cartCount ?? 0).toString(),
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
