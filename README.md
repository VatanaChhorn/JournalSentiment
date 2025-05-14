# JournalSentiment

A Swift package that analyzes text sentiment using Apple's NaturalLanguage framework and provides tailored feedback messages, affirmations, and reflection prompts for journal entries.

## Features

- **Sentiment Analysis**: Convert free-form text into a sentiment score and category.
- **Feedback Library**: Load feedback messages, affirmations, and prompts from a JSON resource.
- **Easy APIs**: Use `SentimentAnalyzer` for analysis and `JournalSentimentManager` for combined sentiment+feedback.
- **CLI Example**: An `Example` executable target demonstrates usage out of the box.
- **Test Coverage**: Includes XCTest targets for all core functionality.

## Requirements

- Swift 5.7 or later
- macOS 12.0+ / iOS 13.0+
- Xcode 14+ for IDE support

## Installation

Add to your project via Swift Package Manager:

1. In Xcode select _File > Add Packages..._
2. Enter your repository URL or local path
3. Choose the `JournalSentiment` package and desired version

Or reference locally in your `Package.swift`:

```swift
.package(path: "/path/to/JournalSentiment"),
```  

Then add the `JournalSentiment` target as a dependency for your app or library.

## Usage

### Programmatic (Library)

```swift
import JournalSentiment

// 1. Analyze raw text
let analyzer = SentimentAnalyzer()
let result = try analyzer.analyze("I had a fantastic day!")
print(result.description) // e.g. "Very Positive (0.95)"

// 2. Retrieve a one-off feedback message
let manager = JournalSentimentManager()
if let message = manager.getFeedback(for: "I had a fantastic day!", type: .message) {
    print(message)
}
```

### Swift REPL

```bash
cd /path/to/JournalSentiment
swift repl --package-path .

# At the prompt:
1> import JournalSentiment
2> try SentimentAnalyzer().analyze("I love this!")
3> JournalSentimentManager().getFeedback(for: "I love this!")
```

### Command-Line Example

The `Example` executable demonstrates running through a set of sample entries:

```bash
swift run Example
```  

Modify or build your own CLI by adding an `executableTarget` to `Package.swift`.

## Testing

Run all tests with:

```bash
swift test
```

You'll see XCTest validating sentiment categorization, error handling, feedback lookup, and manager orchestration.

## Project Structure

```
JournalSentiment/
├── Package.swift            # SwiftPM manifest
├── README.md               # (You are here!)
├── Sources/
│   ├── Example/            # CLI demonstration
│   │   └── main.swift
│   └── JournalSentiment/   # Core library
│       ├── Models/         # Data types and errors
│       │   ├── SentimentCategory.swift
│       │   ├── SentimentResult.swift
│       │   └── SentimentAnalysisError.swift
│       ├── Services/       # Analysis logic
│       │   └── SentimentAnalyzer.swift
│       ├── Feedback/       # Feedback loader & picker
│       │   └── SentimentFeedbackHandler.swift
│       ├── Manager/        # Orchestrates analysis + feedback
│       │   └── JournalSentimentManager.swift
│       └── Resources/      # JSON data
│           └── sentiment_feedback.json
└── Tests/
    └── JournalSentimentTests/  # XCTest suite
        └── JournalSentimentTests.swift
```

## Contributing

Contributions, issues, and feature requests are welcome! Please read the [contribution guidelines](CONTRIBUTING.md) if available, or open an issue.

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for details. 