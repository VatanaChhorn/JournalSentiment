import Foundation

public enum SentimentAnalysisError: Error {
    case emptyText
    case processingFailed
    case noSentimentDetected

    public var localizedDescription: String {
        switch self {
        case .emptyText: return "Cannot analyze empty text"
        case .processingFailed: return "Failed to process the text"
        case .noSentimentDetected: return "No sentiment could be detected"
        }
    }
} 