# SwiftColors 🎨

A simple color toolkit that provides solid colors from popular design systems for Apple Platforms (iOS, macOS, watchOS, tvOS and visionOS). SwiftColors also provides helpful RGB helpers for `UIColor`, `Color`, and `NSColor`.

> This package is a modern revival of a simple Swift extension I originally wrote back in 2019 to bring Material Design colors into my personal iOS apps. I find myself constantly reaching for colors from popular design systems when prototyping, so I built and shared this toolkit to make them available for anyone who needs them.

## Supported Systems

- Material Design (v2)
- Tailwind (v4)
- Bootstrap (v5)
- Radix (v3)
- Web Awesome (v3.14)

## Installation

### Xcode

To add `SwiftColors` to an existing Xcode project:
1. Go to **File > Add Package Dependencies...**
2. Paste the repository URL: `https://github.com/tyeporter/SwiftColors.git`
3. Select **Up to Next Major Version** and select your project as the target.

### Swift Package Manager

For installation with Swift Package Manager, simply add the following to your `Package.swift`:

```
.package(url: "https://github.com/tyeporter/SwiftColors.git", from: "1.0.0")
```

## Usage

Color tokens are prefixed by their design system (e.g., `md..` for Material Design, `tw..` for Tailwind, etc.) to prevent namespace collisions with Apple's standard colors.

To use color tokens, simply import the package and use standard dot-syntax:

### SwiftUI Example

```swift
import SwiftUI
import SwiftColors

struct ContentView: View {
	var body: some View {
		Text("Hello, World")
			.foregroundStyle(.mdBlueGray50)
			.background(.twSky800)
	}
}
```

### UIKit Example

```swift
import UIKit
import SwiftColors

let button = UIButton()
button.backgroundColor = .twSky800
button.setTitleColor(.mdBlueGray50, for: .normal)
```

### AppKit Example

```swift
import AppKit
import SwiftColors

let view = NSView()
view.layer?.backgroundColor = NSColor.twSky800.cgColor
```

## Contributing

`SwiftColors` uses a generator script (`Scripts/SwiftColorsGenerator.swift`) to build the Swift extensions that provide the color tokens.

To add new colors or edit existing colors:

1. Open `Resources/Colors.json`
2. Add the new token under its respective system using the following format:
```json
{
	"name": "prefixedColorName",
	"red": 42,
	"green": 34,
	"blue": 254
}
```
3. Run the generator script from the root directory using `make`:
```bash
make generate
```

> **NOTE**: The generator script allows JSON5 syntax, so comments and trailing commas are supported in `Colors.json`.

## License

[MIT License](LICENSE)
