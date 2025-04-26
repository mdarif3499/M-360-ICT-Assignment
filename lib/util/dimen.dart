import 'package:flutter/material.dart';

class Dimen {

  static const int _large = 470;
  static const int _medium = 420;
  static const int _small = 380;

  static double extraLargeTitleFontSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > _large) {
      return 22;
    } else if (MediaQuery.of(context).size.width > _medium) {
      return 20;
    } else if (MediaQuery.of(context).size.width > _small) {
      return 19;
    } else {
      return 17;
    }
  }

  static double largeTitleFontSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > _large) {
      return 20;
    } else if (MediaQuery.of(context).size.width > _medium) {
      return 18;
    } else if (MediaQuery.of(context).size.width > _small) {
      return 17;
    } else {
      return 15;
    }
  }

  static double titleFontSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > _large) {
      return 18;
    } else if (MediaQuery.of(context).size.width > _medium) {
      return 16;
    } else if (MediaQuery.of(context).size.width > _small) {
      return 15;
    } else {
      return 14;
    }
  }

  static double largeTextSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > _large) {
      return 18;
    } else if (MediaQuery.of(context).size.width > _medium) {
      return 16;
    } else if (MediaQuery.of(context).size.width > _small) {
      return 15;
    } else {
      return 13;
    }
  }

  static double textSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > _large) {
      return 16;
    } else if (MediaQuery.of(context).size.width > _medium) {
      return 14;
    } else if (MediaQuery.of(context).size.width > _small) {
      return 13;
    } else {
      return 12;
    }
  }

  static double smallTextSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > _large) {
      return 13;
    } else if (MediaQuery.of(context).size.width > _medium) {
      return 12;
    } else if (MediaQuery.of(context).size.width > _small) {
      return 11;
    } else {
      return 10;
    }
  }

  static const defaultBorderValue = 5.0;
  static const statusBorderValue = 20.0;
}
