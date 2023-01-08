import 'dart:io';

import 'package:agricrops/auth.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/cart_provider.dart';
import 'package:agricrops/providers/category_provider.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:agricrops/providers/farmers_association_provider.dart';
import 'package:agricrops/providers/order_provider.dart';
import 'package:agricrops/providers/uom_provider.dart';
import 'package:agricrops/screens/cart/cart_list.dart';
import 'package:agricrops/screens/crop/crop_list/crop_list.dart';
import 'package:agricrops/screens/farmers_association/list/farmers_association_list.dart';
import 'package:agricrops/screens/order/buyer/buyer_orders.dart';
import 'package:agricrops/screens/order/farmer/farmer_orders.dart';
import 'package:agricrops/screens/profile/profile.dart';
import 'package:agricrops/screens/user/userlist/user_list.dart';
import 'package:agricrops/services/cart_service.dart';
import 'package:agricrops/services/category_service.dart';
import 'package:agricrops/services/crop_service.dart';
import 'package:agricrops/services/farmers_association_service.dart';
import 'package:agricrops/services/order_service.dart';
import 'package:agricrops/services/uom_service.dart';
import 'package:agricrops/services/user_service.dart';
import 'package:agricrops/utilities/global_utiility.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/screens/auth/signup/signup.dart';
import 'package:provider/provider.dart';

import 'providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   name: 'AgriCrops',
  //   options: const FirebaseOptions(
  //     apiKey: 'AIzaSyC0iFHJM8I-bUrc5AVYDJtIFW6tsW8bm5U',
  //     appId: '1:297610823532:android:327f96d6ba5478dcb3d549',
  //     messagingSenderId: '297610823532',
  //     projectId: 'agricrops-76be1',
  //   ),
  // );

  await Firebase.initializeApp();

  // if (kDebugMode) {
  //   await _configureLocalFirebaseAuth();
  //   await _configureLocalFirebaseStorage();
  //   _configureLocalFirebaseFirestore();
  //   _configureLocalFirebaseFunctions();
  // }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthProvider(
            FirebaseAuth.instance,
            UserService.instance,
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(
            UserService.instance,
            FarmersAssociationService.instance,
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              FarmersAssociationProvider(FarmersAssociationService.instance),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CategoryProvider(CategoryService()),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              CropProvider(CropService(), OrderService()),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UomProvider(UomService.instance),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartProvider(CartService.instance),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              OrderProvider(OrderService.instance),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackbarUtility.messengerKey,
      navigatorKey: navigatorKey,
      title: 'AgriCrops',
      theme: ThemeData(
        scaffoldBackgroundColor: kWhite,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: kPrimarySwatch,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/farmers-association': (context) =>
            const FarmersAssociationListScreen(),
        '/users': (context) => const UserListScreen(),
        '/crop-list': (context) => const CropListScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/cart': (context) => const CartListScreen(),
        '/buyer-orders': (context) => const BuyerOrdersScreen(),
        '/farmer-orders': (context) => const FarmerOrdersScreen()
      },
    );
  }
}

Future<void> _configureLocalFirebaseAuth() async {
  final defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  await FirebaseAuth.instance.useAuthEmulator(defaultHost, 9099);
}

void _configureLocalFirebaseFirestore() {
  final defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  firebaseFirestore.useFirestoreEmulator(defaultHost, 8080);
}

Future<void> _configureLocalFirebaseStorage() async {
  final defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  await firebaseStorage.useStorageEmulator(defaultHost, 9199);
}

void _configureLocalFirebaseFunctions() {
  final defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  firebaseFunctions.useFunctionsEmulator(defaultHost, 5001);
}
