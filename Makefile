.PHONY: generate

generate:
	@echo "⚙️ Generating SwiftColors.swift ..."
	swiftc -parse-as-library Scripts/SwiftColors.swift -o Sources/SwiftColors/SwiftColors
	cd Sources/SwiftColors && ./SwiftColors
	rm -f Sources/SwiftColors/SwiftColors
	@echo "✨ Generation complete."

