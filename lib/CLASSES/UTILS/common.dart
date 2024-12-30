import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ritevet_dart/CLASSES/UTILS/RESOURCES/resources.dart';
import 'package:ritevet_dart/CLASSES/UTILS/theme.dart';

// COMMON
String BG_IMAGE = "assets/images/bg.png";
String LOGO_1000 = "assets/images/logo_1000.png";

// SVG
var svgPath = 'assets/images/svg';
var svgPathRecharge = 'assets/images/recharge';
var formatSVG = 'svg';
Widget svgImage(imageName, height, width, {ColorFilter? colorFilter}) {
  return SvgPicture.asset(
    '$svgPath/$imageName.$formatSVG',
    height: height,
    width: width,
    colorFilter:
        colorFilter ?? const ColorFilter.mode(Colors.black, BlendMode.srcIn),
  );
}

Color hexToColor(String hexString) {
  hexString = hexString.replaceAll('#', '');
  if (hexString.length == 6) {
    hexString = 'FF$hexString';
  }
  return Color(int.parse(hexString, radix: 16));
}

// FONTS
class FontFamiltyNameUtils {
  var fontOrbitron = 'o';
  var fontPoppins = 'p';
  var fontMont = 'm';
  var headerFont = 'p';
  var subHeaderFont = 'p';
}

// WIDGET
Widget customText(
  String text,
  double fontSize,
  BuildContext context, {
  String? fontFamily,
  FontWeight fontWeight = FontWeight.normal,
  Color? darkModeColor, // Optional dark mode color
  Color? lightModeColor, // Optional light mode color
}) {
  final isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
  return textFont(
    text,
    isDarkMode
        ? (darkModeColor ?? Colors.white)
        : (lightModeColor ?? Colors.black),
    fontSize,
    fontFamily ?? FontFamiltyNameUtils().fontPoppins,
    fontWeight: fontWeight,
  );
}

// WIDGET FONT
Widget textFont(text, color, size, font, {FontWeight? fontWeight}) {
  if (font == 'p') {
    return Text(
      text.toString(),
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      maxLines: 2,
    );
  } else if (font == 'o') {
    return Text(
      text.toString(),
      style: GoogleFonts.orbitron(
        color: color,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  } else if (font == 'I') {
    return Text(
      text.toString(),
      style: GoogleFonts.inter(
        color: color,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  } else {
    return Text(
      text.toString(),
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  String? type;
  final List<Widget>? actions;
  final Widget? leading;

  CustomAppbar({
    super.key,
    required this.title,
    this.type,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: customText(
        title,
        18.0,
        context,
        fontWeight: FontWeight.w800,
        darkModeColor: hexToColor(AppResources.hexColor.whiteColor),
        lightModeColor: hexToColor(AppResources.hexColor.whiteColor),
      ),
      centerTitle: true,
      leading: leading,
      actions: actions,
      backgroundColor: Provider.of<ThemeNotifier>(context).isDarkMode
          ? AppResources.colors.appDarkModeBackgroundColor
          : AppResources.colors.appLightModeBackgroundColor,
      // hexToColor(AppResources.hexColor.brightOrange),
      /*type == 'blog'
          ? hexToColor(AppResources.hexColor.lightOrange) // blog
          : type == 'addTrip'
              ? hexToColor(AppResources.hexColor.brownColor)
              : hexToColor(AppResources.hexColor.lightOrange),*/
      // AppResources.colors.backgroundThemeColor,

      // hexToColor(AppResources.colors.whiteColor),
      automaticallyImplyLeading: false,
      // automaticallyImplyLeading: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/////////////// CONTAINER
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool secureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.secureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 6.0),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white, // Adjust color as needed
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: TextFormField(
          obscureText: secureText,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: suffixIcon,
            border: InputBorder.none, // Removes the border
            enabledBorder: InputBorder.none, // Removes border when not focused
            focusedBorder: InputBorder.none, // Removes border when focused
            filled: true, // Enables background color
            fillColor: Colors.transparent, // Makes background transparent
          ),
          validator: validator,
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/////////////// BUTTON
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class CustomButton extends StatelessWidget {
  final String text; // Mandatory parameter
  final double? height;
  final double? width;
  final Color? color;
  final double borderRadius;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.text, // Text is mandatory
    this.height,
    this.width,
    this.color,
    this.borderRadius = 12.0,
    this.textStyle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 14.0, left: 14.0, top: 8.0),
        child: Container(
          height: height,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: color ?? Colors.transparent, // Default color is blue
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Default text color
                ),
          ),
        ),
      ),
    );
  }
}
