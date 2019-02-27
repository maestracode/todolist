//
//  TodoListTableViewCell.swift
//  todolist
//
//  Created by omaestra on 27/02/2019.
//  Copyright © 2019 maestracode. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var item: ToDoItem? {
        didSet {
            setupView()
        }
    }
    
    private var completed: Bool = false {
        didSet {
            self.accessoryType = completed ? .checkmark : .none
            self.checkButton.isSelected = completed
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        taskTitleLabel.text = item?.title
        completed = item?.done ?? false
    }

    @IBAction func checkButtonPressed(_ sender: UIButton) {
        item?.done = !completed
        completed = !completed
    }
}
