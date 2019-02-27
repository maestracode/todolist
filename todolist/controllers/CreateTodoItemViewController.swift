//
//  CreateTodoItemViewController.swift
//  todolist
//
//  Created by omaestra on 27/02/2019.
//  Copyright © 2019 maestracode. All rights reserved.
//

import UIKit

protocol TodoItemDelegate {
    func create(item: ToDoItem)
    func delete(item: ToDoItem)
    func update()
}

class CreateTodoItemViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskNotesLabel: UILabel!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDoneButton: UIButton!
    
    var delegate: TodoItemDelegate!
    var item: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskNotesTextView.layer.borderWidth = 1.0
        taskNotesTextView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        taskNotesTextView.layer.cornerRadius = 3.0
        
        self.taskTitleTextField.text = item?.title
        self.taskNotesTextView.text = item?.notes
        self.taskDoneButton.isHidden = (item == nil)
        self.taskDoneButton.isSelected = item?.done ?? false
        
        taskTitleTextField.becomeFirstResponder()
        
        self.addHideKeyboardGestureRecognizer()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneButtonPressed(_ sender: Any) {
        item?.done = !taskDoneButton.isSelected
        taskDoneButton.isSelected = !taskDoneButton.isSelected
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let taskTitle = self.taskTitleTextField.text, taskTitle != "" else { return }
        let taskNotes = taskNotesTextView.text
        let isDone = taskDoneButton.isSelected
        
        if let currentItem = item {
            currentItem.title = taskTitle
            currentItem.notes = taskNotes
            currentItem.done = isDone
            self.delegate.update()
        } else {
            let newItem = ToDoItem(title: taskTitle, notes: taskNotes)
            self.delegate.create(item: newItem)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
