//
//  RegisterView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Register",
                       subTitle: "run ur errands bettr",
                       angle: 20,
                       background: .pink)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
