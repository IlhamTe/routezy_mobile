import 'dart:io';

import 'package:flutter/material.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';

class AppPadding {
  const AppPadding._();

  /// Padding Horizontal
  static EdgeInsets ph0 = EdgeInsets.symmetric(horizontal: 0);
  static EdgeInsets ph2 = EdgeInsets.symmetric(horizontal: 2);
  static EdgeInsets ph4 = EdgeInsets.symmetric(horizontal: 4);
  static EdgeInsets ph8 = EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsets ph10 = EdgeInsets.symmetric(horizontal: 10);
  static EdgeInsets ph12 = EdgeInsets.symmetric(horizontal: 12);
  static EdgeInsets ph16 = EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets ph18 = EdgeInsets.symmetric(horizontal: 18);
  static EdgeInsets ph20 = EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets ph24 = EdgeInsets.symmetric(horizontal: 24);
  static EdgeInsets ph32 = EdgeInsets.symmetric(horizontal: 32);
  static EdgeInsets ph40 = EdgeInsets.symmetric(horizontal: 40);

  /// Padding Vertical
  static EdgeInsets pv0 = EdgeInsets.symmetric(vertical: 0);
  static EdgeInsets pv2 = EdgeInsets.symmetric(vertical: 2);
  static EdgeInsets pv4 = EdgeInsets.symmetric(vertical: 4);
  static EdgeInsets pv8 = EdgeInsets.symmetric(vertical: 8);
  static EdgeInsets pv10 = EdgeInsets.symmetric(vertical: 10);
  static EdgeInsets pv12 = EdgeInsets.symmetric(vertical: 12);
  static EdgeInsets pv16 = EdgeInsets.symmetric(vertical: 16);
  static EdgeInsets pv18 = EdgeInsets.symmetric(vertical: 18);
  static EdgeInsets pv20 = EdgeInsets.symmetric(vertical: 20);
  static EdgeInsets pv24 = EdgeInsets.symmetric(vertical: 24);
  static EdgeInsets pv32 = EdgeInsets.symmetric(vertical: 32);
  static EdgeInsets pv40 = EdgeInsets.symmetric(vertical: 40);

  /// Padding All
  static EdgeInsets pa0 = EdgeInsets.all(0);
  static EdgeInsets pa2 = EdgeInsets.all(2);
  static EdgeInsets pa4 = EdgeInsets.all(4);
  static EdgeInsets pa8 = EdgeInsets.all(8);
  static EdgeInsets pa10 = EdgeInsets.all(10);
  static EdgeInsets pa12 = EdgeInsets.all(12);
  static EdgeInsets pa16 = EdgeInsets.all(16);
  static EdgeInsets pa18 = EdgeInsets.all(18);
  static EdgeInsets pa20 = EdgeInsets.all(20);
  static EdgeInsets pa24 = EdgeInsets.all(24);
  static EdgeInsets pa32 = EdgeInsets.all(32);
  static EdgeInsets pa40 = EdgeInsets.all(40);

  /// Padding Bottom Only
  static EdgeInsets pb0 = EdgeInsets.only(bottom: 0);
  static EdgeInsets pb2 = EdgeInsets.only(bottom: 2);
  static EdgeInsets pb4 = EdgeInsets.only(bottom: 4);
  static EdgeInsets pb8 = EdgeInsets.only(bottom: 8);
  static EdgeInsets pb10 = EdgeInsets.only(bottom: 10);
  static EdgeInsets pb12 = EdgeInsets.only(bottom: 12);
  static EdgeInsets pb16 = EdgeInsets.only(bottom: 16);
  static EdgeInsets pb20 = EdgeInsets.only(bottom: 18);
  static EdgeInsets pb24 = EdgeInsets.only(bottom: 24);
  static EdgeInsets pb32 = EdgeInsets.only(bottom: 32);
  static EdgeInsets pb40 = EdgeInsets.only(bottom: 40);
  static EdgeInsets pb64 = EdgeInsets.only(bottom: 64);

  /// Padding Top Only
  static EdgeInsets pt0 = EdgeInsets.only(top: 0);
  static EdgeInsets pt2 = EdgeInsets.only(top: 2);
  static EdgeInsets pt4 = EdgeInsets.only(top: 4);
  static EdgeInsets pt8 = EdgeInsets.only(top: 8);
  static EdgeInsets pt10 = EdgeInsets.only(top: 10);
  static EdgeInsets pt12 = EdgeInsets.only(top: 12);
  static EdgeInsets pt16 = EdgeInsets.only(top: 16);
  static EdgeInsets pt20 = EdgeInsets.only(top: 18);
  static EdgeInsets pt24 = EdgeInsets.only(top: 24);
  static EdgeInsets pt32 = EdgeInsets.only(top: 32);
  static EdgeInsets pt40 = EdgeInsets.only(top: 40);

  /// Padding Left Only
  static EdgeInsets pl0 = EdgeInsets.only(left: 0);
  static EdgeInsets pl2 = EdgeInsets.only(left: 2);
  static EdgeInsets pl4 = EdgeInsets.only(left: 4);
  static EdgeInsets pl8 = EdgeInsets.only(left: 8);
  static EdgeInsets pl10 = EdgeInsets.only(left: 10);
  static EdgeInsets pl12 = EdgeInsets.only(left: 12);
  static EdgeInsets pl16 = EdgeInsets.only(left: 16);
  static EdgeInsets pl20 = EdgeInsets.only(left: 18);
  static EdgeInsets pl24 = EdgeInsets.only(left: 24);
  static EdgeInsets pl32 = EdgeInsets.only(left: 32);
  static EdgeInsets pl40 = EdgeInsets.only(left: 40);

  /// Padding Right Only
  static EdgeInsets pr0 = EdgeInsets.only(right: 0);
  static EdgeInsets pr2 = EdgeInsets.only(right: 2);
  static EdgeInsets pr4 = EdgeInsets.only(right: 4);
  static EdgeInsets pr8 = EdgeInsets.only(right: 8);
  static EdgeInsets pr10 = EdgeInsets.only(right: 10);
  static EdgeInsets pr12 = EdgeInsets.only(right: 12);
  static EdgeInsets pr16 = EdgeInsets.only(right: 16);
  static EdgeInsets pr20 = EdgeInsets.only(right: 18);
  static EdgeInsets pr24 = EdgeInsets.only(right: 24);
  static EdgeInsets pr32 = EdgeInsets.only(right: 32);
  static EdgeInsets pr40 = EdgeInsets.only(right: 40);

  /// Padding Horizontal (Naming Based on Design System)
  static EdgeInsets phNull = ph0;
  static EdgeInsets phXXS = ph2;
  static EdgeInsets phXS = ph4;
  static EdgeInsets phSM = ph8;
  static EdgeInsets phMD = ph12;
  static EdgeInsets phLG = ph16;
  static EdgeInsets phXL = ph24;
  static EdgeInsets phXXL = ph32;
  static EdgeInsets phXXL2 = ph40;

  /// Padding Vertical (Naming Based on Design System)
  static EdgeInsets pvNull = pv0;
  static EdgeInsets pvXXS = pv2;
  static EdgeInsets pvXS = pv4;
  static EdgeInsets pvSM = pv8;
  static EdgeInsets pvMD = pv12;
  static EdgeInsets pvLG = pv16;
  static EdgeInsets pvXL = pv24;
  static EdgeInsets pvXXL = pv32;
  static EdgeInsets pvXXL2 = pv40;

  /// Padding All (Naming Based on Design System)
  static EdgeInsets paNull = pa0;
  static EdgeInsets paXXS = pa2;
  static EdgeInsets paXS = pa4;
  static EdgeInsets paSM = pa8;
  static EdgeInsets paMD = pa12;
  static EdgeInsets paLG = pa16;
  static EdgeInsets paXL = pa24;
  static EdgeInsets paXXL = pa32;
  static EdgeInsets paXXL2 = pa40;

  /// Padding Top Only (Naming Based on Design System)
  static EdgeInsets ptNull = pt0;
  static EdgeInsets ptXXS = pt2;
  static EdgeInsets ptXS = pt4;
  static EdgeInsets ptSM = pt8;
  static EdgeInsets ptMD = pt12;
  static EdgeInsets ptLG = pt16;
  static EdgeInsets ptXL = pt24;
  static EdgeInsets ptXXL = pt32;
  static EdgeInsets ptXXL2 = pt40;

  /// Padding Bottom Only (Naming Based on Design System)
  static EdgeInsets pbNull = pb0;
  static EdgeInsets pbXXS = pb2;
  static EdgeInsets pbXS = pb4;
  static EdgeInsets pbSM = pb8;
  static EdgeInsets pbMD = pb12;
  static EdgeInsets pbLG = pb16;
  static EdgeInsets pbXL = pb24;
  static EdgeInsets pbXXL = pb32;
  static EdgeInsets pbXXL2 = pb40;

  /// Padding Left Only (Naming Based on Design System)
  static EdgeInsets plNull = pl0;
  static EdgeInsets plXXS = pl2;
  static EdgeInsets plXS = pl4;
  static EdgeInsets plSM = pl8;
  static EdgeInsets plMD = pl12;
  static EdgeInsets plLG = pl16;
  static EdgeInsets plXL = pl24;
  static EdgeInsets plXXL = pl32;
  static EdgeInsets plXXL2 = pl40;

  /// Padding Right Only (Naming Based on Design System)
  static EdgeInsets prNull = pr0;
  static EdgeInsets prXXS = pr2;
  static EdgeInsets prXS = pr4;
  static EdgeInsets prSM = pr8;
  static EdgeInsets prMD = pr12;
  static EdgeInsets prLG = pr16;
  static EdgeInsets prXL = pr24;
  static EdgeInsets prXXL = pr32;
  static EdgeInsets prXXL2 = pr40;

  static EdgeInsets bottomNavigationVertical({
    EdgeInsets? topPadding,
    EdgeInsets? androidBottomPadding,
  }) {
    final basePadding = topPadding ?? AppPadding.ptLG;
    final bottomPadding = SizeHelper.getBottomBarHeight > 0 && Platform.isIOS
        ? EdgeInsets.only(bottom: SizeHelper.getBottomBarHeight)
        : androidBottomPadding ?? AppPadding.pbLG;

    return basePadding + bottomPadding;
  }
}
