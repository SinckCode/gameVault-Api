import Fluent
import Vapor

final class Game: Model, Content, @unchecked Sendable {
    static let schema = "videojuegos"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "descripcion")
    var descripcion: String

    @Field(key: "rating")
    var rating: String

    @Field(key: "plat")
    var plataformas: String

    @Field(key: "genero")
    var genero: String

    @Field(key: "precio")
    var precio: Double

    @Field(key: "img")
    var imagenURL: String

    init() {}

    init(nombre: String, descripcion: String, rating: String, plataformas: String, genero: String, precio: Double, imagenURL: String) {
        self.nombre = nombre
        self.descripcion = descripcion
        self.rating = rating
        self.plataformas = plataformas
        self.genero = genero
        self.precio = precio
        self.imagenURL = imagenURL
    }
}
