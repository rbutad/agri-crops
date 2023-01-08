import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/spacer_constant.dart';
import 'package:agricrops/enums/role_enum.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/screens/home/components/dashboard_crop_list.dart';
import 'package:agricrops/screens/dashboards/farmer_dashboard/farmer_dashboard.dart';
import 'package:agricrops/screens/home/components/home_drawer.dart';
import 'package:agricrops/screens/widgets/cart_badge_counter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMEEEEd().format(
                          DateTime.now(),
                        ),
                        style: const TextStyle(fontSize: 11),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'Welcome',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CartBadgeCounter(),
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const CircleAvatar(
                          backgroundColor: kGreen,
                          child: Icon(
                            Icons.person,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Material(
                elevation: 10.0,
                color: kWhite,
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: kAppPadding * 0.75,
                      horizontal: kAppPadding,
                    ),
                    fillColor: kWhite,
                    hintText: 'Search crop...',
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      size: 25,
                      color: kGreen,
                    ),
                  ),
                  onSubmitted: (value) {
                    // TODO: Search functionality here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const HomeDrawerComponent(),
      body: authProvider.appUser?.role == Role.buyer
          ? buyerWidget(context)
          : FarmerDashboard(userUid: authProvider.user!.uid),
    );
  }

  Widget buyerWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kAppPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Freshfood from farm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Easy to pick your food!',
                          style: TextStyle(
                            color: Color(0xFFE2E2E2),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const DashboardCropListComponent()
          ],
        ),
      ),
    );
  }
}
