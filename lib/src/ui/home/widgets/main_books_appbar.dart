import 'package:cme_flutter_assessment/src/data/manager/secure_storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBooksAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MainBooksAppbar({super.key});

  @override
  State<MainBooksAppbar> createState() => _MainBooksAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainBooksAppbarState extends State<MainBooksAppbar> {
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
