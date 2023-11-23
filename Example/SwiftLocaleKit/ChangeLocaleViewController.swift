//
//  ChangeLocaleViewController.swift
//  SwiftLocaleKit_Example
//
//  Created by Kyrylo Mukha on 23.11.2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftLocaleKit
import UIKit

class ChangeLocaleViewController: UIViewController {
	@IBOutlet private weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}
}

extension ChangeLocaleViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		/// Using sortet list of `all` supported langes by your app. Priority to sorting is `preferedLanguages`, then default order.
		return LocaleKit.shared.sortedLanguages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell: UITableViewCell!
		if let _cell = tableView.dequeueReusableCell(withIdentifier: "langCell") {
			cell = _cell
		} else {
			cell = UITableViewCell(style: .subtitle, reuseIdentifier: "langCell")
		}
		
		let language = LocaleKit.shared.sortedLanguages[indexPath.row]
		
		/// Localized `language` name in it's native locale like in `iOS settings`.
		cell.textLabel?.text = language.nativeName
		/// Localized `language` name in `currentLanguage` from LocaleKit.
		/// By default `currentLanguage` is the same as system seted by default for your app on start.
		cell.detailTextLabel?.text = language.currentLocaleName
		
		/// Place `checkmark` `accessoryType` for `currentLanguage`
		cell.accessoryType = language == LocaleKit.shared.currentLanguage ? .checkmark : .none
		 
		return cell
	}
}

extension ChangeLocaleViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		view.isUserInteractionEnabled = false
		
		let selectedLanguage = LocaleKit.shared.sortedLanguages[indexPath.row]
		
		/// Set new localization language.
		/// Handle locale changes and reload UI in completion
		LocaleKit.shared.setLocale(selectedLanguage) { [weak self] in
			/// Start UI reload after language select.
			/// In our example will use local `Notificatication`
			NotificationCenter.default.post(name: Notification.Name(rawValue: "App.reloadLocaleNotification"), object: nil)
			
			DispatchQueue.main.async { [weak self] in
				self?.navigationController?.popViewController(animated: true)
			}
		}
	}
}
