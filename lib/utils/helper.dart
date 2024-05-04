import 'package:flutter/material.dart';

void printINFO(dynamic text, {String tag = 'audioz Music'}) {
  debugPrint("\x1B[32m[$tag]: $text");
}
