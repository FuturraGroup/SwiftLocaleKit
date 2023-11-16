//
//  Bundle.swift
//
//
//  Created by Kyrylo Mukha on 15.11.2023.
//

import Foundation

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
}
