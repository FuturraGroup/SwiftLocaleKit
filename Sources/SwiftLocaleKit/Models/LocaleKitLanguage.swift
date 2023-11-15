//
//  LocaleKitLanguage.swift
//
//
//  Created by Kyrylo Mukha on 15.11.2023.
//

import Foundation

public struct LocaleKitLanguage: Equatable {
	let code: String

	var locale: Locale {
		Locale(identifier: code)
	}

	var nativeName: String {
		locale.localizedString(forLanguageCode: code) ?? ""
	}

	var deviceLocaleName: String {
		Locale.current.localizedString(forLanguageCode: code) ?? ""
	}

	var currentLocaleName: String {
		LocaleKit.shared.currentLanguage.locale.localizedString(forLanguageCode: code) ?? ""
	}
}

public extension LocaleKitLanguage {
	static func == (lhs: LocaleKitLanguage, rhs: LocaleKitLanguage) -> Bool {
		return lhs.code == rhs.code
	}
}
