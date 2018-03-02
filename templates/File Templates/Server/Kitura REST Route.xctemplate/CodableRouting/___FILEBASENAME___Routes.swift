//___FILEHEADER___

import Foundation
import LoggerAPI
import KituraContracts

/* A simple boilerplate API for a memory driven store inspired by:
 *
 *   https://github.com/IBM/ToDoBackend
 *
 * Please: Don't actually do it like this, use it as a starting 
 *         point ;-)
 */
func initialize___FILEBASENAME___(app: ___PACKAGENAMEASIDENTIFIER___App) {
  
    // MARK: - Store
    
    // Simple In-Memory Store. Replace as you like, but be careful w/ threading.
    // If that gets complex, move it into the proper location.
    let storeLock = NSLock()
    var store     = [ ___VARIABLE_productName___ ]()
    var nextId    : Int = 0
    
    func execute<R>(_ block: () -> ( R )) -> R {
        storeLock.lock(); defer { storeLock.unlock() }
        return block()
    }
    
    
    // MARK: - Routes
    
    app.router.get("/___VARIABLE_urlPrefix___") { done in // get-all
        done(store, nil) // return the full array
    }
    
    app.router.get("/___VARIABLE_urlPrefix___") { id, done in // get-by-id
        done(store.first(where: { $0.id == id }), nil)
    }
    
    app.router.post("/___VARIABLE_urlPrefix___") {
        ( item: ___VARIABLE_productName___, done: ( ___VARIABLE_productName___?, RequestError? ) -> Void ) in
        
        var item = item
        
        // modify item as you please, e.g. fill in default values
        
        execute {
            item.id = nextId; nextId += 1
            store.append(item)
        }
        done(item, nil)
    }
    
    app.router.delete("/___VARIABLE_urlPrefix___") { done in // delete all
        execute {
            store.removeAll()
        }
        done(nil)
    }
    app.router.delete("/___VARIABLE_urlPrefix___") { (id : Int, done ) in
        execute {
            guard let idx = store.index(where: { $0.id == id }) else { return }
            store.remove(at: idx)
        }
        done(nil)
    }
    
    app.router.patch("/___VARIABLE_urlPrefix___") {
        ( id: Int, new: ___VARIABLE_productName___, done: ( ___VARIABLE_productName___?, RequestError? ) -> Void ) in
        
        let result = execute { () -> ( ___VARIABLE_productName___? ) in
            guard let idx = store.index(where: { $0.id == id }) else { return nil }
            var current = store[idx]
            
            // In here, update properties, e.g.:
            // current.title = new.title ?? current.title
            
            store[idx] = current
            return current
        }
      
        if let result = result { done(result, nil)}
    }
}
