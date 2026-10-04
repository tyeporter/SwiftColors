//
//  SwiftColors.swift
//  SwiftColors
//
//  Created by Tye Porter on 10/2/26.
//

import Foundation

enum Framework: String, CaseIterable {
    case uiKit = "UIKit"
    case swiftUI = "SwiftUI"
    case appKit = "AppKit"

    var extends: String {
        switch self {
        case .uiKit: "UIColor"
        case .swiftUI: "ShapeStyle where Self == Color"
        case .appKit: "NSColor"
        }
    }

    var colorClass: String {
        switch self {
        case .uiKit: "UIColor"
        case .swiftUI: "Color"
        case .appKit: "NSColor"
        }
    }

    var hasAlpha: Bool {
        switch self {
        case .uiKit, .appKit: true
        case .swiftUI: false
        }
    }
}

enum SwiftColorSystem: String, Codable {
    case materialDesign = "Material Design"
    case tailwind = "Tailwind"
    case bootstrap = "Bootstrap"
	case radix = "Radix"
	case webAwesome = "Web Awesome"

    var colorFileName: String {
        "Color+\(self.rawValue.replacingOccurrences(of: " ", with: "")).swift"
    }
}

struct SwiftColor: Codable {
    let name: String
    let red: Int
    let green: Int
    let blue: Int
}

struct SwiftColorPallete: Codable {
    let system: SwiftColorSystem
    let version: Double
    let colors: [SwiftColor]
}

@main
struct SwiftColorsGenerator {
	static let PROJECT_ROOT_DIRECTORY = FileManager.default.currentDirectoryPath
	static let RESOURCES_DIRECTORY = "\(PROJECT_ROOT_DIRECTORY)/Resources"
	static let SOURCES_DIRECTORY = "\(PROJECT_ROOT_DIRECTORY)/Sources/SwiftColors"
    static let INPUT_FILE_NAME = "Colors.json"

    static func getRGBFileContents(for framework: Framework) -> String {
        let functions = """
            /// Creates a color object using standard RGB values from 0 to 255.
            ///
            /// - Parameters:
            ///   - red: The red component value, specified as a value from 0 to 255.
            ///   - green: The green component value, specified as a value from 0 to 255.
            ///   - blue: The blue component value, specified as a value from 0 to 255.
            /// - Returns: A corresponding color object.
            static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> \(framework.colorClass) {
                return \(framework.colorClass)(red: red/255, green: green/255, blue: blue/255\(framework.hasAlpha ? ", alpha: 1" : ""))
            }

            /// Creates a color object using standard RGB values from 0 to 255.
            ///
            /// - Parameters:
            ///   - red: The red component value, specified as a value from 0 to 255.
            ///   - green: The green component value, specified as a value from 0 to 255.
            ///   - blue: The blue component value, specified as a value from 0 to 255.
            /// - Returns: A corresponding color object.
            static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> \(framework.colorClass) {
                return \(framework.colorClass)(red: red/255, green: green/255, blue: blue/255\(framework.hasAlpha ? ", alpha: 1" : ""))
            }
        """

        return """
        // MARK: - Support for \(framework.rawValue)

        #if canImport(\(framework.rawValue))

        import \(framework.rawValue)

        public extension \(framework.colorClass) {
        \(functions)
        }

        #endif
        """
    }

    static func getFileContents(for framework: Framework, with pallete: SwiftColorPallete) -> String {
        let fields = pallete.colors.map { color in
            """
                /// A color object based on \(pallete.system.rawValue) (v\(pallete.version)) with RGB values of \(color.red), \(color.green), and \(color.blue).
                static var \(color.name): \(framework.colorClass) { \(framework.colorClass).rgb(\(color.red), \(color.green), \(color.blue)) }
            """
        }.joined(separator: "\n\n")

        return """
        // MARK: - Support for \(framework.rawValue)

        #if canImport(\(framework.rawValue))

        import \(framework.rawValue)

        public extension \(framework.extends) {
        \(fields)
        }

        #endif
        """
    }

    static func generateRGBFile() throws {
        let outputURL = URL(fileURLWithPath: SOURCES_DIRECTORY)
            .appendingPathComponent("Color+RGB.swift")

        let generatedCode = """
        //
        // AUTO-GENERATED FILE - THIS FILE IS NOT MEANT TO BE EDITED MANUALLY
        // PLEASE SEE `README.md` FOR INFORMATION ON HOW TO UPDATE COLORS
        //

        \(getRGBFileContents(for: .uiKit))

        \(getRGBFileContents(for: .swiftUI))

        \(getRGBFileContents(for: .appKit))
        """
        try generatedCode.write(to: outputURL, atomically: true, encoding: .utf8)

        print("✅ Successfully generated RGB file.")
    }

    static func generateColorFiles() throws {
        let colorsFile = URL(fileURLWithPath: RESOURCES_DIRECTORY)
            .appendingPathComponent(INPUT_FILE_NAME)
        let fileData = try Data(contentsOf: colorsFile)

        let decoder = JSONDecoder()
        decoder.allowsJSON5 = true
        let palletes = try decoder.decode([SwiftColorPallete].self, from: fileData)

        for pallete in palletes {
            let outputURL = URL(fileURLWithPath: SOURCES_DIRECTORY)
                .appendingPathComponent(pallete.system.colorFileName)

            let generatedCode = """
            //
            // AUTO-GENERATED FILE - THIS FILE IS NOT MEANT TO BE EDITED MANUALLY
            // PLEASE SEE `README.md` FOR INFORMATION ON HOW TO UPDATE COLORS
            //

            \(getFileContents(for: .uiKit, with: pallete))

            \(getFileContents(for: .swiftUI, with: pallete))

            \(getFileContents(for: .appKit, with: pallete))
            """

            try generatedCode.write(to: outputURL, atomically: true, encoding: .utf8)
        }

        print("✅ Successfully generated color files.")
    }

    static func main() {
        do {
            try generateRGBFile()
            try generateColorFiles()
        } catch {
            print("❌ There was an error: \(error.localizedDescription)")
        }
    }
}

