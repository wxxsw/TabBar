![TabBar](https://github.com/wxxsw/TabBar/blob/master/Images/logo.png?0223)

<p align="center">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-Swift%205-f48041.svg?style=flat"></a>
<a href="https://developer.apple.com/swiftui"><img src="https://img.shields.io/badge/framework-SwiftUI-blue.svg?style=flat"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS%2013%2b-blue.svg?style=flat"></a>
<a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat"></a>
<a href="https://codebeat.co/projects/github-com-wxxsw-tabbar-master"><img alt="codebeat badge" src="https://codebeat.co/badges/9e0e57a0-4833-45a3-b370-b7aa7234f353" /></a>
<a href="https://github.com/wxxsw/TabBar/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
</p>
<br/>

## Installation

### Swift Package Manager

1. Select `Xcode -> File -> Swift Packages -> Add Package Dependency...` 
2. Enter `https://github.com/wxxsw/TabBar`.
3. Click `Next`, then select the version, complete.

### Requirements

- iOS 13+
- Xcode 11+
- Swift 5+

## Quick Start

```swift
struct ContentView : View {
    @State private var selection: Int = 0
    
    var body: some View {
        NavigationView {
            TabBar(selection: $selection) {
                HomeView()
                    .tabBarItem(0) { Image("chat") }
                ContactView()
                    .tabBarItem(1) { Image("contact") }
                DiscoverView()
                    .tabBarItem(2) { Image("discover") }
                MeView()
                    .tabBarItem(3) { Image("me") }
            }
        }
    }
}
```

## Demo

Open `TabBar.xcodeproj` and run `Demo` target.

## License

TabBar is released under the MIT license. [See LICENSE](https://github.com/wxxsw/TabBar/blob/master/LICENSE) for details.
