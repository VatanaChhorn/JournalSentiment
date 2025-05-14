import JournalSentiment

let manager = JournalSentimentManager()

let examples = [
    "Today was absolutely horrible. Everything went wrong and I feel terrible.",
    "I had a pretty bad day. Several things didn't go as planned.",
    "Today was okay, but I felt a bit down at times.",
    "Just a normal day, nothing special happened.",
    "I had a pretty good day overall. Some nice things happened.",
    "Today was really great! I accomplished a lot and felt good.",
    "Best day ever! Everything was perfect and I couldn't be happier!"
]

for example in examples {
    print("\n-------------------------------------")
    print("JOURNAL ENTRY: \"\(example)\"")
    
    if let (sentiment, feedback) = manager.processJournalEntry(example) {
        print("SENTIMENT: \(sentiment.description)")
        
        if let message = feedback[.message] {
            print("\nFEEDBACK: \(message)")
        }
        
        if let affirmation = feedback[.affirmation] {
            print("\nAFFIRMATION: \(affirmation)")
        }
        
        if let prompt = feedback[.prompt] {
            print("\nREFLECTION PROMPT: \(prompt)")
        }
    }
    print("-------------------------------------")
}