import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

abstract class ColorHexTools {
  static const Color clearColor = Color.fromRGBO(0, 0, 0, 0);

  static Color colorHexRGB(int r, int g, int, b) {
    return Color.fromRGBO(r, g, b, 1.0);
  }

  static Color colorHex16(int hex, {double alpha = 1.0}) {
    double realAlpha = max(alpha, 0.0);
    realAlpha = min(realAlpha, 1.0);

    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, realAlpha);
  }
}

abstract class ImageAssetsTools {
  static const String imagePath = "assets/images";
  static const String imageSuffix = ".png";

  static const String appTabbarIconFonts = "AppTabbarIconFonts";

  static String imageAssetsName(String name) {
    return "${imagePath}/${name}${imageSuffix}";
  }

  static Image imageAssets(String name) {
    String imagePath = ImageAssetsTools.imageAssetsName(name);
    return Image.asset(imagePath);
  }

  static Icon iconFonts(int codePoint, String iconFontsFamily) {
    return Icon(IconData(codePoint, fontFamily: iconFontsFamily));
  }

  static Icon tabbarIconFonts(int codePoint) {
    return iconFonts(codePoint, appTabbarIconFonts);
  }
}

abstract class ContainerTools {
  static Container clipOvalNetImageContainer(String networkUrl, Size size,
      {String placeholder = "home_icon_def"}) {
    return Container(
      height: size.height,
      width: size.width,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: networkUrl,
          imageBuilder: (BuildContext context, ImageProvider imageProvider) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
              ),
            );
          },
          placeholder: (BuildContext context, String url) {
            return Container(
              child: Image.asset(ImageAssetsTools.imageAssetsName(placeholder),
                  fit: BoxFit.cover, alignment: Alignment.center),
            );
          },
        ),
      ),
    );
  }

  static SizedBox boxContainer(
      @required Size size, @required Widget bodyWidget) {
    return SizedBox.fromSize(
        size: size,
        child: Container(
          child: bodyWidget,
        ));
  }

  static Container rowMarginTainer({double rowOffsets = 10.0}) {
    return Container(
      height: 1.0,
      width: rowOffsets,
      color: ColorHexTools.clearColor,
    );
  }

  static Container columnMarginTainer({double columnOffsets = 10.0}) {
    return Container(
      height: columnOffsets,
      width: 1.0,
      color: ColorHexTools.clearColor,
    );
  }
}

abstract class ScreenTools {
  static double AppScreenContextWidths(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double AppScreenContextHeights(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
