// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@available(swift 5.5)
@available(macOS 10.15, iOS 12, watchOS 6, tvOS 13, *)
public final class LocaleKit {
	public static let shared = LocaleKit()
	
	private init() {
		if LocaleKitStorage.systemLocaleCode == nil, let code = preferedLanguages.first?.code {
			LocaleKitStorage.systemLocaleCode = code
		}
		
		if let code = preferedLanguages.first?.code, LocaleKitStorage.systemLocaleCode != code {
			LocaleKitStorage.systemLocaleCode = code
		}
		
		if let appLocaleUpdateDate = LocaleKitStorage.appLocaleUpdateDate, let systemLocaleUpdateDate = LocaleKitStorage.systemLocaleUpdateDate, systemLocaleUpdateDate > appLocaleUpdateDate, LocaleKitStorage.appLocaleCode != LocaleKitStorage.systemLocaleCode {
			LocaleKitStorage.appLocaleCode = LocaleKitStorage.systemLocaleCode
		}
	}
	
	/// Current app localization
	public var currentLanguage: LocaleKitLanguage {
		var langCode = Locale.preferredLanguages.first ?? ""
		if let appLocaleUpdateDate = LocaleKitStorage.appLocaleUpdateDate, let systemLocaleUpdateDate = LocaleKitStorage.systemLocaleUpdateDate, appLocaleUpdateDate > systemLocaleUpdateDate, let code = LocaleKitStorage.appLocaleCode {
			langCode = code
		} else if let code = LocaleKitStorage.systemLocaleCode ?? LocaleKitStorage.appLocaleCode {
			langCode = code
		}
		
		return LocaleKitLanguage(code: langCode)
	}
	
	/// Prefered languages by user's system settings
	public var preferedLanguages: [LocaleKitLanguage] {
		Locale.preferredLanguages.map { LocaleKitLanguage(code: $0) }
	}
	
	/// All supported languages by your application
	public var allSupportedLanguages: [LocaleKitLanguage] {
		Bundle.main.localizations.map { LocaleKitLanguage(code: $0) }
	}
	
	/// Sorted languages list in order: first `preferedLanguages`, than `allSupportedLanguages` with excluded languages from `preferedLanguages`
	public var sortedLanguages: [LocaleKitLanguage] {
		let prefreredMapped = preferedLanguages.compactMap { lang in
			allSupportedLanguages.contains(lang) || allSupportedLanguages.contains(where: { $0.code == lang.shortCode }) ? lang : nil
		}
		var languages: [LocaleKitLanguage] = prefreredMapped
		
		languages.append(contentsOf: allSupportedLanguages.reduce(into: []) { partialResult, language in
			if !languages.contains(language), !prefreredMapped.contains(where: { $0 == language || (language.shortCode == language.code && language.shortCode == $0.shortCode) }) {
				partialResult.append(language)
			}
		})
		
		return languages
	}
}

@available(swift 5.5)
@available(macOS 10.15, iOS 12, watchOS 6, tvOS 13, *)
public extension LocaleKit {
	/// Changes current localization language value
	///
	/// - Parameters:
	///   - language: Supported language provided from `preferedLanguages`, `allSupportedLanguages` or `sortedLanguages`
	///   - completion: Completion that called after change localization. Use it for reload App UI to show updated localization.
	func setLocale(_ language: LocaleKitLanguage, completion: (() -> ())? = nil) {
		LocaleKitStorage.appLocaleCode = language.code
		
		completion?()
	}
}
