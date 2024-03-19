import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLargeInter => theme.textTheme.bodyLarge!.inter;
  static get bodyLargeInter16 => theme.textTheme.bodyLarge!.inter.copyWith(
        fontSize: 16.fSize,
      );
  static get bodyLargeInterDeeporange500 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.deepOrange500,
      );
  static get bodyMediumInterDeeporange600 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.deepOrange600,
      );
  static get bodyMediumInterErrorContainer =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 14.fSize,
      );
  static get bodyMediumInterOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  // Display text style
  static get displayLarge64 => theme.textTheme.displayLarge!.copyWith(
        fontSize: 64.fSize,
      );
  static get displaySmallDeeporange600 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.deepOrange600,
      );
  // Headline text style
  static get headlineLarge30 => theme.textTheme.headlineLarge!.copyWith(
        fontSize: 30.fSize,
      );
  static get headlineLargeGreen900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.green900,
        fontSize: 30.fSize,
      );
  static get headlineLargeGreen900_1 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.green900,
      );
  static get headlineSmallDeeporange600 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.deepOrange600,
      );
  static get headlineSmallGreen900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.green900,
      );
  static get headlineSmallInter => theme.textTheme.headlineSmall!.inter;
  static get headlineSmallInterGreen900 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.green900,
      );
  static get headlineSmallInterOnPrimary =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get headlineSmallInterOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallOnSecondaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
      );
  // Title text style
  static get titleLargeDeeporange500 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.deepOrange500,
      );
  static get titleLargeDeeporange50001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.deepOrange50001,
        fontWeight: FontWeight.w700,
      );
  static get titleLargePrimaryContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
}

extension on TextStyle {
  TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

  TextStyle get msMadi {
    return copyWith(
      fontFamily: 'Ms Madi',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
