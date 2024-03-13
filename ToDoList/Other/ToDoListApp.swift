//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/12/24.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
