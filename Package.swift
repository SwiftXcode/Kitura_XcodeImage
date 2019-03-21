// swift-tools-version:4.0
import PackageDescription

// The regular Kitura splits the package into an "Application" module and the
// executable.
// We combine them.

let package = Package(
    name: "Kitura_XcodeImage",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git",
                .upToNextMinor(from: "2.6.0")),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git",
                .upToNextMinor(from: "1.7.1")),
        .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", 
                 from: "9.0.0"),
        .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git",
                 from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/Health.git",
                 from: "1.0.0")
    ],
    targets: [
        .target(name: "Kitura_XcodeImage", 
                dependencies: [ 
                    "Kitura" , 
                    "HeliumLogger",
                    "CloudEnvironment",
                    "SwiftMetrics",
                    "Health"
                ])
    ]
)
