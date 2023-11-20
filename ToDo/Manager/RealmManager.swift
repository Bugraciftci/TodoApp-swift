//
//  RealmManager.swift
//  ToDo
//
//  Created by Muhammed Buğra on 19.11.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        }catch{
            print("Error opening Realm \(error)")
        }
    }
    func addTask(taskTitle: String){
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value:["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to realm \(newTask)")
                }
            }catch{
                print("error adding task to Realm \(error)")
            }
        }
    }
    
    func getTasks(){
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    func updateTask(id: ObjectId, completed: Bool){
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write{
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task with id \(id)! Completed status: \(completed)")
                }
            }catch{
                
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    func deleteTask(id: ObjectId){
        if let localRealm = localRealm {
            do {
                let tasksToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                try localRealm.write {
                    for task in tasksToDelete {
                        localRealm.delete(task)
                    }
                    getTasks()
                    print("Deleted task with id \(id)")
                }
            } catch {
                print("Error deleting task \(id) from Realm: \(error)")
            }
        }
    }
}
