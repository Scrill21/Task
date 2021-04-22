//
//  Task.swift
//  Task
//
//  Created by anthony byrd on 4/21/21.
//

import Foundation

class Task: Codable {
    var taskName: String
    var taskNotes: String?
    var taskDueDate: Date?
    var taskIsComplete: Bool
    
    init(taskName: String, taskNotes: String?, taskDueDate: Date?, taskIsComplete: Bool = false) {
        self.taskName = taskName
        self.taskNotes = taskNotes
        self.taskDueDate = taskDueDate
        self.taskIsComplete = taskIsComplete
    }
}//End of class

//MARK: - Extension
extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.taskDueDate == rhs.taskDueDate
    }

}
