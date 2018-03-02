//___FILEHEADER___

import LoggerAPI
// import cows

func initialize___PACKAGENAMEASIDENTIFIER___Routes(app: ___PACKAGENAMEASIDENTIFIER___App) {
    #if false // This is a great place to add your routes
    app.router.get("/") { request, response, _ in
        response.send("Random cow:\n\(cows.vaca())")
    }
    
    app.router.get("/json") { request, response, _ in
        let result : [ String : Any ] = [:]
        try response.send(json: result).end()
    }
    #endif
}
