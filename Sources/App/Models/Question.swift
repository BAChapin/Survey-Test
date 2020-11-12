//
//  Question.swift
//  
//
//  Created by Brett Chapin on 11/11/20.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

final class Question: Model, Content {
    
    static let schema = "questions"
    
    final class Topic: Model, Content {
        
        static let schema = "topics"
        
        @ID(custom: .id)
        var id: ObjectId?
        
        @Field(key: "title")
        var title: String
        
        init() { }
        
        init(topic: String) {
            self.title = topic
        }
    }
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "question")
    var question: String
    
    @Field(key: "topic")
    var topic: String
    
    @Field(key: "answers")
    var answers: [Answer]
    
    init() { }
    
    init(question: String, topic: String, answers: [Answer] = []) {
        self.question = question
        self.topic = topic
        self.answers = answers
    }
    
}
