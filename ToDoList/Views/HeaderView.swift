//
//  HeaderView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {    // layered stack of items
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle)) // to rotate rect
                .offset(y: -50)     // to move rect up
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.gray)
            }
            .padding(.top, 10)  // to give top padding of text vstack
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)  // defines bounds of zstack
        .offset(y: -100)     // to move everything up
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "subTitle", angle: -20, background: .blue)
}
