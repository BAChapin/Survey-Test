import Vapor

func routes(_ app: Application) throws {
    
    try app.register(collection: SurveyController())
    
//    app.get { req in
//        return "It works!"
//    }
//
//    app.get("hello") { req -> String in
//        return "Hello, world!"
//    }
}
