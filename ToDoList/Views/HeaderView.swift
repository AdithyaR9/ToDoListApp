//
//  HeaderView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {    // layered stack of items
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.cyan)
                .rotationEffect(Angle(degrees: 20)) // to rotate rect
                .offset(y: -50)     // to move rect up
            VStack {
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                Text("don't be lazy")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.gray)
            }
            .padding(.top, 10)  // to give top padding of text vstack
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)  // defines bounds of zstack
        .offset(y: -60)     // to move everything up
    }
}

#Preview {
    HeaderView()
}
