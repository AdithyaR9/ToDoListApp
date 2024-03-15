//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var deadlineDate = Date()
    @Published var showAlert = false    // show alert if not all fields filled before saving

    
    init() {}
    
    // to save to data base
    func save() {
        guard canSave else {    // already did before, but just in case here too
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   deadlineDate: deadlineDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        // save the model to DB (as subcollection of current user)
        let db = Firestore.firestore() // instance of database
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
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
