//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = "" // Initialize currentUserId here
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {      // to do on main thread (aka main queue
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    // check if user is signed in
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

