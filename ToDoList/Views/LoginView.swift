//
//  LoginView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {        // allows you to navigate between views
            VStack {    // vertical stack of items
                //Header
                HeaderView()
                
                // Login Form
                Form {
                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        // attempt log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.indigo)
                            
                            Text("Login")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                }
                
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
