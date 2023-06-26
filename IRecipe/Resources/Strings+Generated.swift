// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum IRecipeStrings {
  internal enum Animations {
    /// loading
    internal static let loading = IRecipeStrings.tr("Localizable", "Animations.loading", fallback: "loading")
  }
  internal enum Home {
    /// Localizable.strings
    ///   IRecipe
    /// 
    ///   Created by Vitor Mendes on 26/06/23.
    internal static let title = IRecipeStrings.tr("Localizable", "Home.title", fallback: "Receita")
    internal enum RecipeCell {
      /// Calorias: 
      internal static let calories = IRecipeStrings.tr("Localizable", "Home.RecipeCell.calories", fallback: "Calorias: ")
      /// Tempo: 
      internal static let time = IRecipeStrings.tr("Localizable", "Home.RecipeCell.time", fallback: "Tempo: ")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension IRecipeStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
