import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

final profilePathProvider = StateProvider<XFile?>((ref) {
  return null;
});

final imageFileProvider = StateProvider<File?>((ref) {
  return;
});
