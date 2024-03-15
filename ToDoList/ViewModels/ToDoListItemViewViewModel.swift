//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// viewmodel for a single to do itemview on the to do list
// secondary view model within the full to do list view (each row (item))
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemTemp = item
        itemTemp.setDone(!itemTemp.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemTemp.id)
            .setData(itemTemp.asDictionary())
    }
}
