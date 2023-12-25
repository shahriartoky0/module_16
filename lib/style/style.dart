import 'package:flutter/material.dart';

Decoration containerDecoration() {
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 10,
        offset: const Offset(0, 3),
      ),
    ],
  );
}

TextStyle heading1 ()
{
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.grey
  );
}
TextStyle score ()
{
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black
  );
}
TextStyle body ()
{
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );
}
