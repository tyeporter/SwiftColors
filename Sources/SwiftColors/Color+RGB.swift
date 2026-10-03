//
// AUTO-GENERATED FILE - THIS FILE IS NOT MEANT TO BE EDITED MANUALLY
// PLEASE SEE `README.md` FOR INFORMATION ON HOW TO UPDATE COLORS
//

// MARK: - Support for UIKit

#if canImport(UIKit)

import UIKit

public extension UIColor {
    /// Creates a color object using standard RGB values from 0 to 255.
    ///
    /// - Parameters:
    ///   - red: The red component value, specified as a value from 0 to 255.
    ///   - green: The green component value, specified as a value from 0 to 255.
    ///   - blue: The blue component value, specified as a value from 0 to 255.
    /// - Returns: A corresponding color object.
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }

    /// Creates a color object using standard RGB values from 0 to 255.
    ///
    /// - Parameters:
    ///   - red: The red component value, specified as a value from 0 to 255.
    ///   - green: The green component value, specified as a value from 0 to 255.
    ///   - blue: The blue component value, specified as a value from 0 to 255.
    /// - Returns: A corresponding color object.
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

#endif

// MARK: - Support for SwiftUI

#if canImport(SwiftUI)

import SwiftUI

public extension Color {
    /// Creates a color object using standard RGB values from 0 to 255.
    ///
    /// - Parameters:
    ///   - red: The red component value, specified as a value from 0 to 255.
    ///   - green: The green component value, specified as a value from 0 to 255.
    ///   - blue: The blue component value, specified as a value from 0 to 255.
    /// - Returns: A corresponding color object.
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color {
        return Color(red: red/255, green: green/255, blue: blue/255)
    }

    /// Creates a color object using standard RGB values from 0 to 255.
    ///
    /// - Parameters:
    ///   - red: The red component value, specified as a value from 0 to 255.
    ///   - green: The green component value, specified as a value from 0 to 255.
    ///   - blue: The blue component value, specified as a value from 0 to 255.
    /// - Returns: A corresponding color object.
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> Color {
        return Color(red: red/255, green: green/255, blue: blue/255)
    }
}

#endif

// MARK: - Support for AppKit

#if canImport(AppKit)

import AppKit

public extension NSColor {
    /// Creates a color object using standard RGB values from 0 to 255.
    ///
    /// - Parameters:
    ///   - red: The red component value, specified as a value from 0 to 255.
    ///   - green: The green component value, specified as a value from 0 to 255.
    ///   - blue: The blue component value, specified as a value from 0 to 255.
    /// - Returns: A corresponding color object.
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> NSColor {
        return NSColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }

    /// Creates a color object using standard RGB values from 0 to 255.
    ///
    /// - Parameters:
    ///   - red: The red component value, specified as a value from 0 to 255.
    ///   - green: The green component value, specified as a value from 0 to 255.
    ///   - blue: The blue component value, specified as a value from 0 to 255.
    /// - Returns: A corresponding color object.
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> NSColor {
        return NSColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

#endif