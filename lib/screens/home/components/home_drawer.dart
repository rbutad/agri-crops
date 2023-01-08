import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/enums/role_enum.dart';
import 'package:agricrops/models/user/app_user.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/user_provider.dart';
import 'package:agricrops/screens/widgets/cart_badge_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawerComponent extends StatelessWidget {
  const HomeDrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    authProvider.user!.reload();

    return StreamBuilder<AppUser>(
      stream: context.read<UserProvider>().getUser(authProvider.user!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final appUser = snapshot.data!;

        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: kGreen),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    authProvider.user?.displayName ??
                        (authProvider.displayName.isEmpty
                            ? '${authProvider.appUser?.firstName} ${authProvider.appUser?.lastName}'
                            : authProvider.displayName),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              appUser.role == Role.sysadmin
                  ? ListTile(
                      title: const Text('Farmers Association'),
                      onTap: () => Navigator.popAndPushNamed(
                          context, '/farmers-association'),
                    )
                  : Container(),
              (appUser.role == Role.sysadmin || appUser.role == Role.admin)
                  ? ListTile(
                      title: const Text('Users'),
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/users');
                      },
                    )
                  : Container(),
              (appUser.role == Role.farmer)
                  ? ListTile(
                      title: const Text('My Crops'),
                      onTap: () =>
                          Navigator.popAndPushNamed(context, '/crop-list'),
                    )
                  : Container(),
              ListTile(
                title:
                    Text(appUser.role == Role.buyer ? 'My Orders' : 'Orders'),
                onTap: () => appUser.role == Role.buyer
                    ? Navigator.popAndPushNamed(context, '/buyer-orders')
                    : Navigator.popAndPushNamed(context, '/farmer-orders'),
              ),
              (appUser.role == Role.buyer)
                  ? ListTile(
                      title: const Text('Cart'),
                      onTap: () => Navigator.popAndPushNamed(context, '/cart'),
                      trailing: const SizedBox(
                          width: 50,
                          height: 50,
                          child: CartBadgeCounter(useChip: true)),
                    )
                  : Container(),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () => Navigator.popAndPushNamed(context, '/profile'),
              ),
              ListTile(
                title: const Text('Sign Out'),
                onTap: () {
                  authProvider.signOut();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
