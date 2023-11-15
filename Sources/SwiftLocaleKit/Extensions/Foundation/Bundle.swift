//
//  Bundle.swift
//
//
//  Created by Kyrylo Mukha on 15.11.2023.
//

import Foundation

extension Bundle {
	/// Localized bundle with provided `currentLanguage` value from `LocaleKit`
	static var localized: Bundle {
		let langCode = LocaleKit.shared.currentLanguage.code

		guard let path = Bundle.main.path(forResource: langCode, ofType: "lproj"), let localizedBundle = Bundle(path: path) else { return main }

		return localizedBundle
	}
}
