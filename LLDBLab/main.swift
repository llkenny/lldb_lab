final class User {
    let id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

func makeUser() -> User {
    let user = User(id: 42, name: "Max")
    return user
}

let u = makeUser()
print(u.name)
