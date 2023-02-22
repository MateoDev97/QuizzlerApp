//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mateo Ortiz on 22/02/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
