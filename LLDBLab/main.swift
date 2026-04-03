func makeUser() -> User {
    let user = User(id: 42, name: "Max")
    return user
}

let u = makeUser()
print(u.name)

// MARK: Retain / Release
var c: User? = u // Retain
c = nil // Release

// MARK: Heap / stack
let heapUser = makeUser()                       // heap
let stackUser = StackUser(id: 1, name: "Alex")  // stack
print("")
