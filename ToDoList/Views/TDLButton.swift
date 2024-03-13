//
//  TDLButton.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct TDLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void // action is a closure that takes in no arguments and returns void
    
    var body: some View {
        Button {
            // attempt log in (Action)
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TDLButton(title: "Value", background: .yellow) {
        // button action
    }
}
