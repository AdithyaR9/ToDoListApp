//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""           // like state, when changed, the view will be rerendered
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        // validate credentials validity
        guard validate() else {
            return
        }
        
        // try to log in
        Auth.auth().signIn(withEmail: email, link: password)

    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "fill in all fields"
            return false
        }
        
        //email@foo.com
        guard email.contains("@") && email.contains(".") else {     //validate that email is correct
            errorMessage = "enter valid email"
            return false
        }
        return true
    }
}
