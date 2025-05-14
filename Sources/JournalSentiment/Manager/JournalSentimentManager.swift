import Foundation

public class JournalSentimentManager {
    
    private let feedbackHandler: SentimentFeedbackHandler
    
    public init() {
        self.feedbackHandler = SentimentFeedbackHandler()
    }
    
    public func processJournalEntry(_ text: String) -> (sentiment: SentimentResult, feedback: [SentimentFeedbackHandler.FeedbackType: String])? {
        do {
            let sentimentResult = try SentimentAnalyzer().analyze(text)
            let feedback = feedbackHandler.getAllFeedback(for: sentimentResult)
            return (sentimentResult, feedback)
        } catch {
            print("Error processing journal entry: \(error.localizedDescription)")
            return nil
        }
    }
    
    public func getFeedback(for text: String, type: SentimentFeedbackHandler.FeedbackType = .message) -> String? {
        do {
            let sentimentResult = try SentimentAnalyzer().analyze(text)
            return feedbackHandler.getFeedback(for: sentimentResult, type: type)
        } catch {
            print("Error getting feedback: \(error.localizedDescription)")
            return nil
        }
    }
} 