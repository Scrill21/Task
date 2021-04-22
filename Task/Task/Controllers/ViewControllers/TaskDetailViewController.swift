//
//  TaskDetailViewController.swift
//  Task
//
//  Created by anthony byrd on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    //MARK: - Actions
    /*
     Build out your saveButtonTapped IBAction.
     Make sure to pop the view controller after your code has been executed.
     (Note: If your task landing pad is nil, this button should create a new task.
     If your task has a value, then the save button should update your existing task.
     Make sure, in both instances, to pass the task name, notes, and date (from the date variable you created.)
     */
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextView.text, !notes.isEmpty,
              let date = taskDueDatePicker?.date else {return}
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: date)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func taskDueDatePickerChanged(_ sender: Any) {
        
    }
    
    func updateViews() {
        guard let task = task else {return}
        taskNameTextField.text = task.taskName
        taskNotesTextView.text = task.taskNotes
        taskDueDatePicker.date = task.taskDueDate ?? Date()
    }

}//End of class
