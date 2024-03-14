//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation

// viewmodel for list of items view
// primary tab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false   // will show this view if item is true, and wont if false
    
    init() {}
}
