.PHONY: generate

generate:
	@echo "⚙️ Generating SwiftColors.swift ..."
	swift run SwiftColorsGenerator
	@echo "🚀 Generation complete."

