# SwiftLocaleKit

![Swift Workflow](https://github.com/FuturraGroup/SwiftLocaleKit/actions/workflows/swift.yml/badge.svg)
[![Swift](https://img.shields.io/badge/Swift%20Compatibility-5.5%20%7C%205.6%20%7C%205.7-orange)](https://img.shields.io/badge/Swift%20Compatibility-5.5%20%7C%205.6%20%7C%205.7-orange)
[![Platform](https://img.shields.io/badge/Platform%20Compatibility-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-blue)](https://img.shields.io/badge/Platform%20Compatibility-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-blue)
[![licence](https://img.shields.io/badge/%20licence-MIT-green)](https://img.shields.io/badge/%20licence-MIT-green)

## Overview
The SwiftLocaleKit is libriry for simlify localization and synchronize it with system localization settings and synchronize them.

## Installation

SwiftLocaleKit is available with CocoaPods and Swift Package Manager.

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SwiftLocaleKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SwiftLocaleKit'
```
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding SwiftLocaleKit as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/FuturraGroup/SwiftLocaleKit.git", .branch("main"))
]
```

## Usage

First of all - imoprt `SwiftLocaleKit`
```swift
import SwiftLocaleKit

let localized = "My Awesome string".localized
```

You don't need special setups for using `SwiftLocaleKit`.
After first call singleton of `LocaleKit` it'll setup automaticaly laguage pased by system as default.

For example, getting current language information will setup all basic stuff: 

```swift
let language = LocaleKit.shared.currentLanguage
```

and calling localization will do the same:

```swift
let localized = "My Awesome string".localized
```

There is 3 ways to localize your strings with `SwiftLocaleKit`:

Example 1 how to get `localized` string.
This is simlified version of `NSLocalizedString`
In this case `key` it's your string you calling on this variable property.
```swift
let localized = "My Awesome string".localized
```

Example 2 how to get `localized` string.
This version based on `NSLocalizedString`. Accepts all `NSLocalizedString` parameters except `bundle` and `key`
In this case `key` it's your string you calling on this method.
```swift
let localized = "My Awesome string".localized(comment: "My locale string")
```

Example 3 how to get `localized` string.
This method works like `localized` `property` from `LocaleKit`, but using custom `language` you passed to localize.
In this case `key` it's your string you calling on this method.
You can path any custom `LocaleKitLanguage` to this method.
```swift
let localized = "My Awesome string".localized(LocaleKit.shared.currentLanguage)
```

You can change localization of your app in runtime. All you need - implement reload localized UI in change locale completion.
```swift
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

...

NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "App.reloadLocaleNotification"), object: nil, queue: OperationQueue.main) { [weak self] _ in
    translatedText1Label.text = "My Awesome string".localized
}
```

Also, `SwiftLocaleKit` provides some aditional features:

`currentLanguage` - property of `LocaleKit` singleton that represents default/current selected language.

`preferedLanguages` - property of `LocaleKit` singleton that represents `preferredLanguages` list as array of `LocaleKitLanguage`.

`allSupportedLanguages` - property of `LocaleKit` singleton that represents `all` supported to localizeteon implemented in your app. Also array of `LocaleKitLanguage`.

`sortedLanguages` - Sorted languages list in order: first `preferedLanguages`, than `allSupportedLanguages` with excluded languages from `preferedLanguages`. Also array of `LocaleKitLanguage`.

`LocaleKitLanguage` - sctrucrure used by `LocaleKit` to represent any language and localize your app. Can be inited with any language `code`
```swift
let language = LocaleKitLanguage(code: "en")
let languageZhHans = LocaleKitLanguage(code: "zh-Hans")
```

Has properties:
`code` - language code inited with.

`shortCode` - short version of `code` that drops regoin or/and transcription. For example, if you init:
```swift
let languageZhHans = LocaleKitLanguage(code: "zh-Hans")
```
short code will be:
```swift
print(languageZhHans.shortCode) // Print output: "zh"
```

`locale` - `[Locale](https://developer.apple.com/documentation/foundation/locale)` object based on provided language `code`

`nativeName` - Localized language name on this language.

`deviceLocaleName` - Localized language name on language provided by system. System language can be different from `SwiftLocaleKit` if you change locale in `SwiftLocaleKit`

`currentLocaleName` - Localized language name on `currentLanguage` from `SwiftLocaleKit`

## Contribute

Contributions for improvements are welcomed. Feel free to submit a pull request to help grow the library. If you have any questions, feature suggestions, or bug reports, please send them to [Issues](https://github.com/FuturraGroup/SwiftLocaleKit/issues).

## License

```
MIT License

Copyright (c) 2023 Futurra Group

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
