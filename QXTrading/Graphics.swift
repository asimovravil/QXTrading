//
//  Question.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import Foundation

struct Graphics {
    let text: String
    
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
