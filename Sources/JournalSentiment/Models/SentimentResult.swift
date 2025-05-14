import Foundation

public struct SentimentResult {
    public let score: Double
    public let category: SentimentCategory

    public var description: String {
        return "\(category.rawValue) (\(String(format: "%.2f", score)))"
    }
} 