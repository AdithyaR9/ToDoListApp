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
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder    // allows use to abstract this part of the view
    var accountView: some View {
        TabView {   // tab bar at bottome for each of views
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
