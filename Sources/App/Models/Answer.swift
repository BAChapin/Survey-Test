//
//  Answer.swift
//  
//
//  Created by Brett Chapin on 11/11/20.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

final class Answer: Fields, Content {
    
    @Field(key: "answer")
    var answer: String
    
    @Field(key: "isCorrect")
    var isCorrect: Bool
    
    init() { }
    
    init(answer: String, isCorrect: Bool) {
        self.answer = answer
        self.isCorrect = isCorrect
    }
}
