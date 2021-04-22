//
//  TaskTableViewCell.swift
//  Task
//
//  Created by anthony byrd on 4/21/21.
//

import UIKit

//MARK: - Protocols
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        delegate?.taskCellButtonTapped(self)
    }
    
    //MARK: - Methods
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.taskName
        if task.taskIsComplete {
            completionButton.setBackgroundImage(UIImage(named: "complete"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}//End of class
