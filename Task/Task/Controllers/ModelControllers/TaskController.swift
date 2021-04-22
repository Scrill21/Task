//
//  TaskController.swift
//  Task
//
//  Created by anthony byrd on 4/21/21.
//

import Foundation

class TaskController {
    
    //sharedInstance
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []

    //MARK: - Methods CRUD
    /*
     Go through each CRUD function and build out the logic. Create should create a Task and append it to the tasks array.
     Update should update the passed in task with the new values that were passed in.
     ToggleIsComplete should simply flip the boolean status of a tasks isComplete property.
     Delete should first find the index of the given task (Hint: You will need to implement equatable on your Task model for this to work) and then remove the task at that index from the tasks array.
     Make sure to call your save funtion at the end of each CRUD functionStep 6 might be tough.
     Use previous projects as a reference.
     If you are stuck for more than 20 minutes, reach out in the queue channel for support.
     */

    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(taskName: name, taskNotes: notes, taskDueDate: dueDate)
        tasks.append(newTask)
        
        saveToPersistenceStore()
    }

    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.taskName = name
        task.taskNotes = notes
        task.taskDueDate = dueDate
        
        saveToPersistenceStore()
    }

    func toggleIsComplete(task: Task) {
        task.taskIsComplete = !task.taskIsComplete
    }

    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        
        saveToPersistenceStore()
    }
    
    //MARK: - Persistence
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Task.json")
        
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}//End of class


