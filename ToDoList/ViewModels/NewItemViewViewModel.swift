//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var deadlineDate = Date()
    @Published var showAlert = false    // show alert if not all fields filled before saving

    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        // non empty title
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // date in present or future
        guard deadlineDate >= Date().addingTimeInterval(-86400) else {      // subtract 24 hrs in seconds (-86400) so you don't run into timezone issues
            return false
        }
        return true
    }
}
