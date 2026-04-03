func makeUser() -> User {
    let user = User(id: 42, name: "Max")
    return user
}

let u = makeUser()
print(u.name)

// MARK: Retain / Release

// Retain
var c: User? = u

// Release
c = nil
