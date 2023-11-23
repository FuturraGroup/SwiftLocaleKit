//
//  UserDefaults.swift
//
//
//  Created by Kyrylo Mukha on 15.11.2023.
//

import Foundation

private let lastUpdateSystemLocaleKey: String = "locale.kit.key.lastUpdateSystemLocaleKey"
private let systemLocaleKey: String = "locale.kit.key.systemLocaleKey"

private let lastUpdateAppLocaleKey: String = "locale.kit.key.lastUpdateAppLocaleKey"
private let appLocaleKey: String = "locale.kit.key.appLocaleKey"

@available(swift 5.5)
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public let LocaleKitStorage = { () -> UserDefaults in
	var localeKitBundleId = Bundle.main.bundleIdentifier ?? "locale.kit.lib"
	localeKitBundleId += ".storage"

	return UserDefaults(suiteName: localeKitBundleId) ?? UserDefaults.standard
}()

@available(swift 5.5)
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public extension UserDefaults {
	private(set) var systemLocaleUpdateDate: Date? {
		get { self.value(forKey: lastUpdateSystemLocaleKey) as? Date }
		set { self.set(newValue, forKey: lastUpdateSystemLocaleKey) }
	}

	var systemLocaleCode: String? {
		get { self.string(forKey: systemLocaleKey) }
		set {
			self.set(newValue, forKey: systemLocaleKey)
			self.systemLocaleUpdateDate = Date()
		}
	}

	private(set) var appLocaleUpdateDate: Date? {
		get { self.value(forKey: lastUpdateAppLocaleKey) as? Date }
		set { self.set(newValue, forKey: lastUpdateAppLocaleKey) }
	}

	var appLocaleCode: String? {
		get { self.string(forKey: appLocaleKey) }
		set {
			self.set(newValue, forKey: appLocaleKey)
			self.appLocaleUpdateDate = Date()
		}
	}
}
