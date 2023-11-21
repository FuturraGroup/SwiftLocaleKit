//
//  String.swift
//
//
//  Created by Kyrylo Mukha on 15.11.2023.
//

import Foundation

public extension String {
	/// Localizing string to language provided `currentLanguage` value from `LocaleKit`.
	/// Analog of `NSLocalizedString` mathod.
	/// Can be called on any string.
	/// Doesn't use `key` parameter, bacause your string you calling on it's a `key` value.
	/// Doesn't use `bundle` parameter, because using `localized` bundle value for localization.
	/// Use it to customize another parameters used in `NSLocalizedString` if needed.
	///
	func localized(tableName: String? = nil, value: String = "", comment: String) -> String {
		return NSLocalizedString(self, tableName: tableName, bundle: Bundle.localized, value: value, comment: comment)
	}

	/// Simplified verion of function `localized`. Using all default parameters of `NSLocalizedString` except of required.
	var localized: String {
		return NSLocalizedString(self, bundle: Bundle.localized, comment: "")
	}

	/// Simplified verion of function `localized`. Using all default parameters of `NSLocalizedString` except of required.
	/// - Parameters:
	///   - language: Custom language for localization of type `LocaleKitLanguage`
	func localized(_ language: LocaleKitLanguage) -> String {
		return NSLocalizedString(self, bundle: Bundle.localized(with: language), comment: "")
	}
}
