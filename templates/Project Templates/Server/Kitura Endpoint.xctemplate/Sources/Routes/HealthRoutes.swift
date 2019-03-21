//___FILEHEADER___

import LoggerAPI
import Health
import KituraContracts

func initializeHealthRoutes(app: ___PACKAGENAMEASIDENTIFIER___App) {
    
    app.router.get("/health") { (respondWith: (Status?, RequestError?) -> Void) -> Void in
        if health.status.state == .UP {
            respondWith(health.status, nil)
        } else {
            respondWith(nil, RequestError(.serviceUnavailable, body: health.status))
        }
    }
    
}
