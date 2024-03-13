//
//  RegisterView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register",
                       subTitle: "run ur errands bettr",
                       angle: 20,
                       background: .green)
            
            Form {
                TextField("Name", text: $name)      // $_ is the data property of the State var given above
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $password)   // secure field shows asterisks as it is required
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TDLButton(title: "Create Account",
                          background: .green) {
                    // attempt registration
                }
                .padding()
                
            }
            .offset(y: -60)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
