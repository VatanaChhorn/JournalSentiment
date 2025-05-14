import NaturalLanguage

public struct SentimentAnalyzer {
    public init() {}

    public func analyze(_ text: String) throws -> SentimentResult {
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw SentimentAnalysisError.emptyText
        }

        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text

        guard let sentimentTag = tagger.tag(
            at: text.startIndex,
            unit: .paragraph,
            scheme: .sentimentScore
        ).0,
        let score = Double(sentimentTag.rawValue) else {
            throw SentimentAnalysisError.noSentimentDetected
        }

        let category = SentimentCategory.from(score: score)
        return SentimentResult(score: score, category: category)
    }
} 