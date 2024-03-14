//
//  ContentView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/12/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        // check if user is already signed in
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            // for now
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
