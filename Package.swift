// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SwiftLocaleKit",
	platforms: [
		.iOS(.v13),
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
