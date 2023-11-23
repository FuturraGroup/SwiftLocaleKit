// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SwiftLocaleKit",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.watchOS(.v6),
		.tvOS(.v13)
	],
	products: [
		.library(
			name: "SwiftLocaleKit",
			targets: ["SwiftLocaleKit"]),
	],
	targets: [
		.target(
			name: "SwiftLocaleKit"),
		.testTarget(
			name: "SwiftLocaleKitTests",
			dependencies: ["SwiftLocaleKit"]),
	])
