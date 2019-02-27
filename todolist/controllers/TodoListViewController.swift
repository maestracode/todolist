//
//  TodoListViewController.swift
//  todolist
//
//  Created by omaestra on 27/02/2019.
//  Copyright © 2019 maestracode. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var todoItems = ToDoItem.mockData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateNewTask" {
            guard let destination = segue.destination as? CreateTodoItemViewController else { return }
            
            destination.delegate = self
            if let item = sender as? ToDoItem {
                destination.item = item
            }
        }
    }
    

}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TodoListTableViewCell
        
        let item = todoItems[indexPath.row]
        cell.item = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = todoItems[indexPath.row]
//        item.done = !item.done
//
//        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        self.performSegue(withIdentifier: "toCreateNewTask", sender: item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row < todoItems.count {
            todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
}

extension TodoListViewController: TodoItemDelegate {
    func create(item: ToDoItem) {
        self.todoItems.append(item)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func delete(item: ToDoItem) {
        
    }
    
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
