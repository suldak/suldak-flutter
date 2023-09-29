import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: '70a060e599c0641598be32da0f6790fc');
  String key = await KakaoSdk.origin;
  print("origin: " + key);
  runApp(const MyApp());
}
