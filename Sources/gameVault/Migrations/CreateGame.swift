import Fluent

struct CreateGame: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("videojuegos")
            .field("id", .uuid, .identifier(auto: false), .required, .sql(raw: "DEFAULT (UUID_TO_BIN(UUID()))"))
            .field("nombre", .string, .required)
            .field("descripcion", .string, .required)
            .field("rating", .string, .required)
            .field("plat", .string, .required)
            .field("genero", .string, .required)
            .field("precio", .double, .required)
            .field("img", .string, .required)
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("videojuegos").delete()
    }
}
