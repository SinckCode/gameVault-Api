import Fluent
import Vapor

struct GameController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let games = routes.grouped("videojuegos")
        games.get(use: index)
        games.post(use: create)
        games.get(":gameID", use: get)
        games.put(":gameID", use: update)
        games.delete(":gameID", use: delete)
    }

    func index(req: Request) throws -> EventLoopFuture<[Game]> {
        Game.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Game> {
        let game = try req.content.decode(Game.self)
        return game.save(on: req.db).map { game }
    }

    func get(req: Request) throws -> EventLoopFuture<Game> {
        Game.find(req.parameters.get("gameID"), on: req.db).unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<Game> {
        let updated = try req.content.decode(Game.self)
        return Game.find(req.parameters.get("gameID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { game in
                game.nombre = updated.nombre
                game.descripcion = updated.descripcion
                game.rating = updated.rating
                game.plataformas = updated.plataformas
                game.genero = updated.genero
                game.precio = updated.precio
                game.imagenURL = updated.imagenURL
                return game.save(on: req.db).map { game }
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Game.find(req.parameters.get("gameID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .noContent)
    }
}
