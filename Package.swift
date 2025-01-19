// swift-tools-version:5.10

import PackageDescription

let package = Package(
	name: "trader-dto",
	platforms: [
		.macOS(.v13),
		.iOS(.v15)
	],
	products: [
		.library(name: "TraderDto", targets: ["TraderDto"]),
	],
	targets: [
		.target(name: "TraderDto", dependencies: []),
	]
)

var swiftSettings: [SwiftSetting] {
	[
		.enableUpcomingFeature("DisableOutwardActorInference"),
		.enableExperimentalFeature("StrictConcurrency"),

		/// Used to be like this in Xcode 14:
		//SwiftSetting.unsafeFlags(["-Xfrontend", "-strict-concurrency=complete"]),

		/// Xcode 15 & 16. Remove `=targeted` to use the default `complete`. Potentially isolate to a platform to further reduce scope.
		//.enableExperimentalFeature("StrictConcurrency=targeted", .when(platforms: [.macOS]))

		//	.swiftLanguageVersion(.v6)
	]
}
