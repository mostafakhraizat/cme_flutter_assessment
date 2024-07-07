import 'package:cme_flutter_assessment/core/utils/helper/shared_preferences_helper.dart';
import 'package:cme_flutter_assessment/data/manager/secure_storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  final ValueNotifier<String?> _email = ValueNotifier(null);
  getEmail() async {
    _email.value = await SecureStorageManager().getEmail();
  }

  @override
  void initState() {
    getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: ValueListenableBuilder(
          valueListenable: _email,
          builder: (context, String? email, Widget? child) {
            if (email == null) {
              return const CircularProgressIndicator.adaptive();
            }
            return Text(email.toString());
          }),
      leading: IconButton(
        icon: const Icon(Icons.sort),
        onPressed: () {},
      ),
    );
  }
}
