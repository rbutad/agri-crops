import 'package:agricrops/models/crops/crop/crop.dart';

const _mango = Crop(
  uid: '1',
  imageUrl: 'assets/images/mango.jpg',
  name: 'Fresh Mango',
  description: 'Fresh fruits and vegetables from organic farms',
);

const _redCabbage = Crop(
  uid: '2',
  imageUrl: 'assets/images/redcabbag.jpg',
  name: 'Red Cabbage',
  description: 'Fresh fruits and vegetables from organic farms',
);

const _strawberry = Crop(
  uid: '3',
  imageUrl: 'assets/images/strawberry.jpg',
  name: 'Strawberry',
  description: 'Fresh fruits and vegetables from organic farms',
);

const _orange = Crop(
  uid: '4',
  imageUrl: 'assets/images/orange.jpg',
  name: 'Orange',
  description: 'Fresh fruits and vegetables from organic farms',
);

const _banana = Crop(
  uid: '5',
  imageUrl: 'assets/images/banana.jpg',
  name: 'Banana',
  description: 'Fresh fruits and vegetables from organic farms',
);

const _kiwi = Crop(
  uid: '6',
  imageUrl: 'assets/images/kiwi.jpg',
  name: 'Kiwi',
  description: 'Fresh fruits and vegetables from organic farms',
);

const _tomato = Crop(
  uid: '7',
  imageUrl: 'assets/images/tomato.jpg',
  name: 'Tomato',
  description: 'Fresh fruits and vegetables from organic farms',
);

const _grape = Crop(
  uid: '8',
  imageUrl: 'assets/images/grape.jpg',
  name: 'Grape',
  description: 'Fresh fruits and vegetables from organic farms',
);

final List<Crop> favoriteCrops = [
  _mango,
  _redCabbage,
  _strawberry,
  _tomato,
  _kiwi
];

final List<Crop> freshCropsList = [
  _strawberry,
  _banana,
  _kiwi,
  _orange,
  _grape,
];

final List<Crop> topSellingCrops = [
  _mango,
  _tomato,
  _banana,
  _orange,
  _grape,
];
