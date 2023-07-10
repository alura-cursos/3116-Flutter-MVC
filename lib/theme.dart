import 'package:flutter/material.dart';
abstract class AppColors {
  static Color white = const Color(0xffFFFFFF);
  static Color black = const Color(0xff000000);
  static Color purple = const Color(0xff6C0D60);
  static Color darkPurple = const Color(0xff2B0626);
  static Color mediumPink = const Color(0xffCB6CE6);
  static Color lightPink = const Color(0xffF2C5FF);
  static Color stroke = const Color(0xffA02D91);
  static List<Color> buttonGradient = const <Color>[
    Color(0xffFBEBFF),
    Color(0xffB266FF),
  ];
  static List<Color> backgroundGradient = const <Color>[
    Color(0xff24001F),
    Color(0xffA02D91),
  ];
  static List<Color> modalBackgroundGradient = const <Color> [
    Color(0xFF10020E),
    Color(0xFF10020E),
    Color(0xFF4D1245),
  ];
  static List<Color> homeShadowGradient = const <Color> [
    Color(0x00000000),
    Color(0xFF000000),
  ];
}

abstract class PrimaryButtonProperties {
  static double size = 243;
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.purple,
  );
  static Color iconColor = AppColors.purple;
  static BoxDecoration boxDecoration = BoxDecoration(
      boxShadow: kElevationToShadow[6],
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.buttonGradient,
      ));
}

abstract class SecondaryButtonProperties {
  static double size = 243;
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.lightPink,
  );
  static Color iconColor = AppColors.lightPink;
  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: AppColors.lightPink));
}

abstract class FloatingButtonProperties {
  static double size = 56;
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.purple,
  );
  static Color iconColor = AppColors.purple;
  static BoxDecoration boxDecoration = BoxDecoration(
      boxShadow: kElevationToShadow[6],
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: AppColors.buttonGradient,
      ));
}

abstract class AppBackgroundProperties {
  static BoxDecoration boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: AppColors.backgroundGradient,
    ),
  );
}

abstract class ModalDecorationProperties {
  static TextStyle bookTitle = const TextStyle(fontSize: 22);
  static TextStyle bookAuthor = TextStyle(fontSize: 16, color: AppColors.lightPink,);
  static RoundedRectangleBorder modalBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
    side: BorderSide(color: AppColors.stroke),
  );
  static BoxDecoration boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: AppColors.modalBackgroundGradient,
    ),
  );
}

abstract class DisplayTextProperties {
  static TextStyle textStyle = const TextStyle(fontFamily: "Bigelow Rules", fontSize: 36);
}

abstract class EntryDecorationProperties {
  static TextStyle displayText = const TextStyle(fontSize: 16);
  static TextStyle authorText = TextStyle(fontWeight: FontWeight.w500, color: AppColors.lightPink);
}

abstract class InputDecorationProperties {
  static TextStyle textDecoration = TextStyle(color: AppColors.mediumPink);

  static InputDecoration newInputDecoration(String hintText, String labelText, [Icon? icon]) {
    return InputDecoration(
      prefixIcon: icon,
      prefixIconColor: AppColors.mediumPink,
      hintStyle: TextStyle(color: AppColors.mediumPink),
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.stroke,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.stroke,
        ),
      ),
      labelText: labelText,
    );
  }
}

abstract class HomeShadowProperties {
  static BoxDecoration boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.center,
      end: Alignment.bottomCenter,
      colors: AppColors.homeShadowGradient,
    ),
  );
}
