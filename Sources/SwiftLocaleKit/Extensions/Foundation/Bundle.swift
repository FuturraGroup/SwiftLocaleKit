//
//  Bundle.swift
//
//
//  Created by Kyrylo Mukha on 15.11.2023.
//

import Foundation

@available(swift 5.5)
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public extension Bundle {
	/// Localized bundle with provided `currentLanguage` value from `LocaleKit`
	static var localized: Bundle {
		let langCode = LocaleKit.shared.currentLanguage.code
		let shortLangCode = LocaleKit.shared.currentLanguage.shortCode

		if let path = Bundle.main.path(forResource: langCode, ofType: "lproj"), let localizedBundle = Bundle(path: path) {
			return localizedBundle
		} else if let path = Bundle.main.path(forResource: shortLangCode, ofType: "lproj"), let localizedBundle = Bundle(path: path) {
			return localizedBundle
		}

		return main
	}

	/// Localized bundle with provided  custom `language` of type `LocaleKitLanguage`
	static func localized(with language: LocaleKitLanguage) -> Bundle {
		let langCode = language.code
		let shortLangCode = language.shortCode

		if let path = Bundle.main.path(forResource: langCode, ofType: "lproj"), let localizedBundle = Bundle(path: path) {
			return localizedBundle
		} else if let path = Bundle.main.path(forResource: shortLangCode, ofType: "lproj"), let localizedBundle = Bundle(path: path) {
			return localizedBundle
		}

		return main
	}
}
