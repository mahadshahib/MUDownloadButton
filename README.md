
<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
    <a href="https://img.shields.io/badge/Swift_Package_Manager-compatible-orange">
        <img src="https://img.shields.io/badge/Swift_Package_Manager-compatible-orange" alt="SPM compatible">
    </a>
    <a href="">
        <img src="https://img.shields.io/badge/Licence-MIT-green.svg" alt="License">
    </a>
</p>

**MUDownloadButton** is a Progressive Download button written in pure swift and inspired by AppStore download button . feel free to contribute and pull requests

<p align="center"><img src="https://raw.githubusercontent.com/amerhukic/AHDownloadButton/master/Demo.gif"/>
</p>

## Requirements

- iOS 13.0+
- Swift 5.0+

## Usage

### Code
To use `MUDownloadButton` create an instance and add it to your own view as a subview:
```swift
  let downloadButton = MUDownloadButton()
  downloadButton.frame = CGRect(origin: origin, size: size)
  view.addSubview(downloadButton)
```
The button can have 4 different states:
- `idle` - before downloading state
- `waiting` - between start request and actual start
- `downloading` - when download is started
- `downloaded` - when download finished

The state of the button can be changed through its `state` property.


### Delegate
You can use the `MUDownloadButtonDelegate` to monitor taps on button and state changes .
 The progress of download can be changed through itss `progress` property.


### Customisation



1. Customizable properties are  :

  - `mainTintColor` - main color of button
  - `downloadedButtonImage` - downloaded button image - system images preferred
  - `idleButtonImage` - idle button image - system images preferred
 


## Demo

To run the example project, clone the repo, and run the Demo directory 

## Installation
 Currently only supports SPM and iOS 13+
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding AHDownloadButton as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: https://github.com/mahadshahib/MUDownloadButton.git, .upToNextMajor(from: "0.9.9"))
]
```

## Author

[Mohammad ShahibZadeh](https://t.me/cheetateam)

## License

MUDownloadButton is licensed under the MIT license. Check the [LICENSE](LICENSE) file for details.
