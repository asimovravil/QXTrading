//
//  QuizBrain.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import Foundation

struct GraphicsQuiz {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Graphics(q: "What does the Bollinger Bands indicator primarily help traders analyze?", a: ["Volume fluctuations in the market", "Trend strength and direction.", "Price volatility and potential trend reversal points."], correctAnswer: "Price volatility and potential trend reversal points."),
        Graphics(q: "What is the primary function of the Moving Average Convergence Divergence (MACD) indicator in trading?", a: ["To identify overbought or oversold conditions in the market.", "To spot changes in the strength, direction, momentum, and duration of a trend in a stock's price.", "To measure the volatility of a stock."], correctAnswer: "To spot changes in the strength, direction, momentum, and duration of a trend in a stock's price."),
        Graphics(q: "What does the Relative Strength Index (RSI) primarily indicate?", a: ["The overall trend direction of a stock.", "The volume of stock traded.", "Overbought or oversold conditions in the market."], correctAnswer: "Overbought or oversold conditions in the market."),
        Graphics(q: "Which indicator is commonly used to determine the strength of a current market trend?", a: ["Average Directional Index (ADI)", "Stochastic Oscillator", "Volume Oscillator"], correctAnswer: "Average Directional Index (ADI)"),
        Graphics(q: "In technical analysis, what does a 'head and shoulders' pattern typically predict?", a: ["A continuation of the current trend.", "A bullish trend reversal.", "A bearish trend reversal."], correctAnswer: "A bearish trend reversal.")
    ]

    mutating func prevQuestion() {
        if questionNumber > 0 {
            questionNumber -= 1
        }
    }

    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}
