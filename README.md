# LocalizedTimeAgo

![CocoaPods Version](https://cocoapod-badges.herokuapp.com/v/LocalizedTimeAgo/badge.png) [![Swift](https://img.shields.io/badge/swift-3-orange.svg?style=flat)](https://developer.apple.com/swift/) ![Platform](https://cocoapod-badges.herokuapp.com/p/LocalizedTimeAgo/badge.png) [![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

LocalizedTimeAgo is a time ago framework written in Swift and localized in 42 languages. It uses translations from the popular Objective-C library [DateTools](https://github.com/MatthewYork/DateTools).

## Supported Localizations

Amharic, Arabic, Basque, Bulgarian, Catalan, Chinese (Simplified), Chinese (Traditional), Croatian, Czech, Danish, Dutch, English, Finnish, French, German, Greek, Gujarati, Hebrew, Hindi, Hungarian, Icelandic, Indonesian, Italian, Japanese, Korean, Latvian, Malay, Norwegian, Polish, Portuguese (Brazil), Portuguese (Portugal), Romanian, Russian, Slovak, Slovenian, Spanish, Swedish, Thai, Turkish, Ukranian, Vietnamese, Welsh

## Installation

> _Note:_ LocalizedTimeAgo requires Swift 3 (and [Xcode][] 8) or greater.
>
> Targets using LocalizedTimeAgo must support embedded Swift frameworks.

[Xcode]: https://developer.apple.com/xcode/downloads/

### Swift Package Manager

[Swift Package Manager](https://github.com/apple/swift-package-manager) is Apple's
official package manager for Swift frameworks. To install with Swift Package
Manager:

1. Add LocalizedTimeAgo to your Package.swift file:

    ```
    import PackageDescription

    let package = Package(
        name: "MyAppTarget",
        dependencies: [
            .Package(url: "https://github.com/toddkramer/LocalizedTimeAgo",
                     majorVersion: 1, minor: 0)
        ]
    )
    ```

2. Run `swift build`.

3. Generate Xcode project:

    ```
    swift package generate-xcodeproj
    ```


### Carthage

[Carthage][] is a decentralized dependency manager for Cocoa projects. To
install LocalizedTimeAgo with Carthage:

 1. Make sure Carthage is [installed][Carthage Installation].

 2. Add LocalizedTimeAgo to your Cartfile:

    ```
    github "toddkramer/LocalizedTimeAgo" ~> 1.0.0
    ```

 3. Run `carthage update` and [add the appropriate framework][Carthage Usage].


[Carthage]: https://github.com/Carthage/Carthage
[Carthage Installation]: https://github.com/Carthage/Carthage#installing-carthage
[Carthage Usage]: https://github.com/Carthage/Carthage#adding-frameworks-to-an-application


### CocoaPods

[CocoaPods][] is a centralized dependency manager for Cocoa projects. To install
LocalizedTimeAgo with CocoaPods:

 1. Make sure the latest version of CocoaPods is [installed](https://guides.cocoapods.org/using/getting-started.html#getting-started).


 2. Add LocalizedTimeAgo to your Podfile:

    ``` ruby
    use_frameworks!

    pod 'LocalizedTimeAgo', '~> 1.0.0'
    ```

 3. Run `pod install`.

[CocoaPods]: https://cocoapods.org
