//
//  ViewController.swift
//  SwiftLocaleKit
//
//  Created by Kyrylo Mukha on 11/14/2023.
//  Copyright (c) 2023 Kyrylo Mukha. All rights reserved.
//

import SwiftLocaleKit
import UIKit

class ViewController: UIViewController {
	@IBOutlet private weak var localeNameLebel: UILabel!
	@IBOutlet private weak var translatedText1Label: UILabel!
	@IBOutlet private weak var translatedText2Label: UILabel!
	@IBOutlet private weak var translatedText3Label: UILabel!
	
	private var observer: [NSObjectProtocol] = []
	
	deinit {
		observer.forEach { NotificationCenter.default.removeObserver($0) }
		observer.removeAll()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
        
		registerObservers()
		
		reloadLocale()
	}

	private func registerObservers() {
		/// Regiater `observer` for change locale `notification`
		NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "App.reloadLocaleNotification"), object: nil, queue: OperationQueue.main) { [weak self] _ in
			self?.reloadLocale()
		}
	}
    
	private func reloadLocale() {
		/// Get localized locale name example
		localeNameLebel.text = "\(LocaleKit.shared.currentLanguage.deviceLocaleName) - \(LocaleKit.shared.currentLanguage.currentLocaleName)"
		
		/// Example 1 how to get `localized` string.
		/// Simlified version of `NSLocalizedString`
		/// /// In this case `key` it's your string you calling on this variable property.
		translatedText1Label.text = "example_string_1".localized
		
		/// Example 2 how to get `localized` string.
		/// Version based on `NSLocalizedString`. Accepts all `NSLocalizedString` parameters except `bundle` and `key`
		/// In this case `key` it's your string you calling on this method.
		translatedText2Label.text = "example_string_2".localized(comment: "My locale string")
		
		/// Example 2 how to get `localized` string.
		/// This method works like `localized` `property` from `LocaleKit`, but using custom `language` you passed to localize.
		translatedText3Label.text = "example_string_3".localized(LocaleKit.shared.currentLanguage)
	}
}
