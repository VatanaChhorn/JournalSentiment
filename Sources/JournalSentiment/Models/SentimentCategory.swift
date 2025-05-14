import Foundation

public enum SentimentCategory: String {
    case veryNegative = "Very Negative"
    case negative = "Negative"
    case slightlyNegative = "Slightly Negative"
    case neutral = "Neutral"
    case slightlyPositive = "Slightly Positive"
    case positive = "Positive"
    case veryPositive = "Very Positive"

    public static func from(score: Double) -> SentimentCategory {
        switch score {
        case -1.0 ..< -0.6: return .veryNegative
        case -0.6 ..< -0.2: return .negative
        case -0.2 ..< -0.0: return .slightlyNegative
        case 0.0: return .neutral
        case 0.0 ..< 0.2: return .slightlyPositive
        case 0.2 ..< 0.6: return .positive
        case 0.6...1.0: return .veryPositive
        default: return .neutral
        }
    }
} 