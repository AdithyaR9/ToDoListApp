//
//  ProfileView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user) // abstracted to the viewbuilder function
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile") // title for this tab
        }
        .onAppear { // to fetch user
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.yellow)
            .frame(width: 125, height: 125)
            .padding()
        
        // info; name email member since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        // sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.pink)
        .padding()
        
    }
    
}

#Preview {
    ProfileView()
}
