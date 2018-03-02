//___FILEHEADER___

import LoggerAPI

func initialize___FILEBASENAME___(app: ___PACKAGENAMEASIDENTIFIER___App) {

    app.router.get("/___VARIABLE_urlPrefix___") { request, response, _ in
        let result : [ String : Any ] = [ : ]
        try response.send(json: result).end()
    }
    
    app.router.delete("/___VARIABLE_urlPrefix___") { request, response, _ in
        try response.send(status: .notImplemented).end()
    }
    
    app.router.post("/___VARIABLE_urlPrefix___") { request, response, _ in
        try response.send(status: .notImplemented).end()
    }
}
