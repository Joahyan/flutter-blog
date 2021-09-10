import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/config/storage_manager.dart';

import 'mine.dart';

void main() async{

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  // 确保初始化
  WidgetsFlutterBinding.ensureInitialized();
  // 缓存初始化
  await StorageManager.init();

  runApp(MyApp());


}

