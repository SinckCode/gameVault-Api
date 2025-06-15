import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    // Registros de controladores
    try app.register(collection: GameController())
    try app.register(collection: CompanyController())
}
