//
//  ToDoItem.swift
//  todolist
//
//  Created by omaestra on 27/02/2019.
//  Copyright © 2019 maestracode. All rights reserved.
//

import Foundation

class ToDoItem {
    var title: String
    var notes: String?
    var creationDate: Date
    var done: Bool
    
    public init(title: String, notes: String? = nil, creationDate: Date = Date(), done: Bool = false) {
        self.title = title
        self.notes = notes
        self.creationDate = creationDate
        self.done = done
    }
}

extension ToDoItem {
    public class func mockData() -> [ToDoItem] {
        return [
            ToDoItem(title: "Papel", done: true),
            ToDoItem(title: "Chocolate"),
            ToDoItem(title: "Agua"),
            ToDoItem(title: "Azúcar")
        ]
    }
}
