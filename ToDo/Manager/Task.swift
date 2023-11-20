//
//  Task,.swift
//  ToDo
//
//  Created by Muhammed Buğra on 19.11.2023.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id : ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
