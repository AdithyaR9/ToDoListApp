//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let deadlineDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {      // mutating as the above is a struct
        isDone = state
    }
}
