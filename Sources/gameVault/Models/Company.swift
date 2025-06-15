import Fluent
import Vapor

final class Company: Model, Content, @unchecked Sendable {
    static let schema = "empresa"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "fundacion")
    var fundacion: String

    @Field(key: "historia")
    var historia: String

    @Field(key: "img")
    var imagenURL: String

    init() {}

    init(nombre: String, fundacion: String, historia: String, imagenURL: String) {
        self.nombre = nombre
        self.fundacion = fundacion
        self.historia = historia
        self.imagenURL = imagenURL
    }
}
