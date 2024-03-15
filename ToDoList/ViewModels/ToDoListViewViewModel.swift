//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation
import FirebaseFirestore

// viewmodel for list of items view
// primary tab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false   // will show this view if item is true, and wont if false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    // to delete individual to do list items
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
