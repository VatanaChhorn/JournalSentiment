import Foundation
import NaturalLanguage

public class SentimentFeedbackHandler {
    public enum FeedbackType: String, CaseIterable {
        case message = "feedbackMessages"
        case affirmation = "affirmations"
        case prompt = "prompts"
    }
    
    private var feedbackData: [String: [String: [String]]]?
    
    public init(jsonFileName: String = "sentiment_feedback") {
        loadFeedbackData(from: jsonFileName)
    }
    
    private func loadFeedbackData(from fileName: String) {
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        #else
        let bundle = Bundle.main
        #endif
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            print("Error: Could not find \(fileName).json in the bundle")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            feedbackData = try JSONDecoder().decode([String: [String: [String]]].self, from: data)
        } catch {
            print("Error loading feedback data: \(error.localizedDescription)")
        }
    }
    
    public func getFeedback(for sentimentResult: SentimentResult, type: FeedbackType = .message) -> String? {
        let categoryKeyRaw = sentimentResult.category.rawValue.replacingOccurrences(of: " ", with: "")
        let categoryJsonKey = categoryKeyRaw.prefix(1).lowercased() + categoryKeyRaw.dropFirst()
        guard let feedbackData = feedbackData,
              let categoryFeedback = feedbackData[type.rawValue]?[categoryJsonKey],
              !categoryFeedback.isEmpty else {
            return nil
        }
        
        return categoryFeedback.randomElement()
    }
    
    public func getAllFeedback(for sentimentResult: SentimentResult) -> [FeedbackType: String] {
        var result: [FeedbackType: String] = [:]
        
        for type in FeedbackType.allCases {
            if let feedback = getFeedback(for: sentimentResult, type: type) {
                result[type] = feedback
            }
        }
        
        return result
    }
}