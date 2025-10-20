# Homebrew Tap

[![Homebrew](https://img.shields.io/badge/Homebrew-tap-orange)](https://github.com/CalebSargeant/homebrew-tap)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://github.com/CalebSargeant/homebrew-tap/workflows/CI/badge.svg)](https://github.com/CalebSargeant/homebrew-tap/actions)

Centralised Homebrew tap for various CLI tools, with automated updates and best practices.

## Installation

### Tap This Repository

```bash
brew tap CalebSargeant/tap
```

### Install a Formula

Once tapped, you can install any tool from this tap:

```bash
brew install CalebSargeant/tap/<formula-name>
```

Or after tapping, simply:

```bash
brew install <formula-name>
```

## Available Tools

| Tool | Description | Version | Install Command |
|------|-------------|---------|-----------------|
| example-tool | Example CLI tool template | 1.0.0 | `brew install example-tool` |

## Usage Examples

### Example Tool

```bash
# After installation
example-tool --version
example-tool --help
```

## Development

### Adding a New Formula

1. Create a new Ruby file in the `Formula/` directory
2. Follow the template structure from `Formula/example-tool.rb`
3. Test your formula locally:

```bash
brew install --build-from-source ./Formula/your-tool.rb
brew test your-tool
brew audit --strict your-tool
```

### Testing Formulas

```bash
# Install from local tap
brew install --build-from-source ./Formula/your-tool.rb

# Run formula tests
brew test your-tool

# Audit formula for issues
brew audit --strict --online your-tool
```

### Updating Formulas

Formulas are automatically updated via GitHub Actions when new releases are detected. Manual updates can be made by:

1. Updating the version and URL in the formula
2. Running `brew fetch --force <formula>` to get the new SHA256
3. Updating the `sha256` field in the formula
4. Testing the changes locally

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Contribution Guide

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/new-tool`)
3. Add or update formulas in the `Formula/` directory
4. Test your changes locally
5. Commit your changes (`git commit -am 'Add new tool'`)
6. Push to your branch (`git push origin feature/new-tool`)
7. Create a Pull Request

## Best Practices

- Follow [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook) guidelines
- Use `brew audit --strict` to ensure formula quality
- Include a comprehensive `test do` block
- Keep formulas simple and maintainable
- Document any special installation requirements

## Automated Updates

This tap uses GitHub Actions to:

- ✅ Lint formulas on every pull request
- ✅ Verify formula installation
- ✅ Auto-update formulas when new releases are available
- ✅ Validate SHA256 checksums

## Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Formula API](https://rubydoc.brew.sh/Formula)
- [Acceptable Formulae](https://docs.brew.sh/Acceptable-Formulae)

## License

This tap is available under the [MIT License](LICENSE).

## Support

If you encounter any issues or have questions:

- Open an [issue](https://github.com/CalebSargeant/homebrew-tap/issues)
- Check existing [discussions](https://github.com/CalebSargeant/homebrew-tap/discussions)

## Maintainers

- [@CalebSargeant](https://github.com/CalebSargeant)

---

**Note**: This is a third-party tap. For official Homebrew formulas, see [Homebrew/homebrew-core](https://github.com/Homebrew/homebrew-core).
