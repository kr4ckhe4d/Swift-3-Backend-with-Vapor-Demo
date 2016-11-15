import Vapor
let drop = Droplet()

// Simple routing
drop.get("/"){ request in
    return "Hello World!"
}

// Passing params in routing
drop.get("/name",":name"){ request in
    if let name = request.parameters["name"]?.string{
        return "Hello \(name)!"
    }
    return "Error retrieving parameters!"
}

// Returning a view
drop.get("/view"){ request in
    return try drop.view.make("sample.html")
}

drop.run()
