//
//  LoginView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()   // abstracted email password authorization and authentication into model
    
    var body: some View {
        NavigationView {        // allows you to navigate between views
            VStack {    // vertical stack of items
                //Header
                HeaderView(title: "To Do List",
                           subTitle: "don't be lazy",
                           angle: -20,
                           background: .cyan)
                
                
                // Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        // modifiers
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TDLButton(title: "Login", 
                              background: .cyan) {
                        // try to login
                        viewModel.login()   // gets login functionality from the model
                    }
                    .padding()
                    
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("Don't Have an Account?")
                    
                    // takes you to register view view file page stuff
                    NavigationLink("Create one here", destination: RegisterView())
                }
                .padding(.bottom, 30)
                
                
                Spacer()    // moves entire vstack stuff up
            }
        }
        
    }
}

#Preview {
    LoginView()
}
