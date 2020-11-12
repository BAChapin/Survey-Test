//
//  File.swift
//  
//
//  Created by Brett Chapin on 11/11/20.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

struct SurveyController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let question = routes.grouped("question")
        // /question - GET
//        question.get(use: question as! (Request) throws -> Response)
        // /question - POST
        question.post(use: createQuestion)
        // /question/:id - GET
        question.get(":id", use: questionFromId)
        // /question/:id - DELETE
        question.delete(use: deleteAll)
        
    }
    
    func createQuestion(req: Request) throws -> EventLoopFuture<Question> {
        // TODO: return created question
        let question = try req.content.decode(Question.self)
        
//        let topic = Question.Topic.query(on: req.db).filter(\.$title == question.topic).first().guard({ (topic) -> Bool in
//            if topic == nil {
//                
//            }
//        }, else: <#T##Error#>)
//        
//        let topic = Question.Topic(topic: question.topic)
//        
//        topic.create(on: req.db)
        
        return question.save(on: req.db).map { question }
    }
    
    func questionFromId(req: Request) throws -> EventLoopFuture<Question> {
        // TODO: return a question from a given ID
        Question.query(on: req.db).filter(.id, .equal, req.parameters.get("id", as: UUID.self)).first().unwrap(or: Abort(.notFound))
    }
    
    func deleteAll(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Question.query(on: req.db).all().map { question in
            question.forEach { (question) in
                question.delete(on: req.db)
            }
        }.transform(to: .ok)
    }
}
