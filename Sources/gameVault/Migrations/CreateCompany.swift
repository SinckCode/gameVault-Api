import Fluent

struct CreateCompany: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("empresa")
            .field("id", .uuid, .identifier(auto: false), .required, .sql(raw: "DEFAULT (UUID_TO_BIN(UUID()))"))
            .field("nombre", .string, .required)
            .field("fundacion", .string, .required)
            .field("historia", .string, .required)
            .field("img", .string, .required)
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("empresa").delete()
    }
}
