//
//  LocaleKitLanguage.swift
//
//
//  Created by Kyrylo Mukha on 15.11.2023.
//

import Foundation

public struct LocaleKitLanguage: Equatable {
	public let code: String

	public var shortCode: String {
		return locale.languageCode ?? code
	}

	public var locale: Locale {
		Locale(identifier: code)
	}

	/// Language name on it's native localization.
	public var nativeName: String {
		name(for: code, in: locale)
	}

	/// Language name on curent device localization.
	public var deviceLocaleName: String {
		name(for: code, in: Locale.current)
	}

	/// Language name on selected LocaleKit curent language.
	public var currentLocaleName: String {
		name(for: code, in: LocaleKit.shared.currentLanguage.locale)
	}

	private func name(for code: String, in locale: Locale) -> String {
		let langLocale = Locale(identifier: code)
		var codeToLocalize = code
		if code == "zh-HK" {
			codeToLocalize = "zh-Hant"
		}

		var name = locale.localizedString(forIdentifier: codeToLocalize)?.capitalized ?? ""

		if langLocale.languageCode == "zh", let region = langLocale.regionCode, let regionName = locale.localizedString(forRegionCode: region)?.capitalized {
			name += "\(name.isEmpty ? "" : " ")(\(regionName))"
		}

		return name
	}
}

public extension LocaleKitLanguage {
	static func == (lhs: LocaleKitLanguage, rhs: LocaleKitLanguage) -> Bool {
		return lhs.code == rhs.code
	}
}
