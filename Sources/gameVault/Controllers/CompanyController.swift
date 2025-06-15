import Fluent
import Vapor

struct CompanyController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let companies = routes.grouped("companies")
        companies.get(use: index)
        companies.post(use: create)
        companies.get(":companyID", use: get)
        companies.put(":companyID", use: update)
        companies.delete(":companyID", use: delete)
    }

    func index(req: Request) throws -> EventLoopFuture<[Company]> {
        Company.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Company> {
        let company = try req.content.decode(Company.self)
        return company.save(on: req.db).map { company }
    }

    func get(req: Request) throws -> EventLoopFuture<Company> {
        Company.find(req.parameters.get("companyID"), on: req.db).unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<Company> {
        let updated = try req.content.decode(Company.self)
        return Company.find(req.parameters.get("companyID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { company in
                company.nombre = updated.nombre
                company.fundacion = updated.fundacion
                company.historia = updated.historia
                company.imagenURL = updated.imagenURL
                return company.save(on: req.db).map { company }
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Company.find(req.parameters.get("companyID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .noContent)
    }
}
