// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let packageName = "XCTAssertResult"
private let srcPath = "./src/"

let package = Package(
  name: packageName,
  products: [
    .library(name: packageName, targets: [packageName]),
  ],
  targets: [
    .target(name: packageName, path: srcPath),
  ]
)
