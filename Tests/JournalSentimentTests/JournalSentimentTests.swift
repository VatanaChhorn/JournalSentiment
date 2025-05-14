#if canImport(XCTest)
import XCTest
@testable import JournalSentiment

final class JournalSentimentTests: XCTestCase {
    func testSentimentCategoryFrom() throws {
        XCTAssertEqual(SentimentCategory.from(score: 0.5), .positive)
        XCTAssertEqual(SentimentCategory.from(score: -0.7), .veryNegative)
    }

    func testAnalyzeSentimentEmptyText() {
        XCTAssertThrowsError(try SentimentAnalyzer().analyze("")) { error in
            XCTAssertEqual(error as? SentimentAnalysisError, .emptyText)
        }
    }

    func testAnalyzeSentimentWorking() throws {
        let result = try SentimentAnalyzer().analyze("I am very happy today!")
        XCTAssertEqual(result.category, .veryPositive)
    }

    func testFeedbackHandlerReturnsNonNil() {
        let handler = SentimentFeedbackHandler()
        let result = SentimentResult(score: 0.1, category: .slightlyPositive)
        let feedback = handler.getFeedback(for: result, type: .message)
        XCTAssertNotNil(feedback)
    }

    func testManagerProcessJournalEntry() {
        let manager = JournalSentimentManager()
        let output = manager.processJournalEntry("I love this!")
        XCTAssertNotNil(output)
    }
}
#endif 