*** Settings ***

Documentation           Verify that the AI agent provides relevant, accurate, and well-formatted responses
Library                 QWeb 
Resource    ../resources/keywords.robot

*** Test Cases ***
Evaluate response quality, formatting, and relevance
    # Ask a known fact that is present in documentation and see if Copado AI provides a good answer
    # Present something completely false as if it's true and see if Copado AI corrects the user
    # Ask for a diagram and make sure it returns a diagram
    # Ask for a detailed step by step and see if it returns an appropriate structure
    # Ask for a one sentence explanation and check that it's one sentence

Evaluate Response Time and Performance
    # See how long it takes to return a response for simple query
    # See how long it takes to return a response for a complex query

Evaluate context retention across multiple messages
    # Ask it a question with context ex: I am a software engineering intern
    # Converse about something else
    # Ask it to tell me context of the first question

Test strange or invalid inputs
    # XSS Scripting attacks
    # Prompt injection
    # Ask it to break security guardrails
    # Give a nonsensical input to test hallucinations?
    # Input a really long block of text
    # Ask a question in a language and see if it returns a response in the same language

*** Comments ***
Requirements:
- Implement data-driven testing approaches
- Create custom Python keywords for advanced validation
- 5 test cases or more

Things to consider:
- How to programmatically validate an AI response is "good" or "relevant"?
- How to test conversation context retention across multiple messages?
- How to measure and validate response times?
- How to handle edge cases (special characters, very long queries, invalid inputs)?
- How to make tests reusable and maintainable?

Dialogue initiation and interaction:
- Response quality and relevance
- Multi-turn conversation handling
- Response formatting and structure
- Error handling and edge cases
- Performance and response times

Existing keywords to try:

VerifyResponseRelevance
GetResponseRelevance
VerifyResponseHelpfulness
GetResponseHelpfulness
VerifyResponseSimilarity
GetResponseSimilarity
GetContextFaithfulness
VerifyContextPrecision
GetContextPrecision
