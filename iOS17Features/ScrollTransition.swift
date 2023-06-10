//
//  ScrollTransition.swift
//  iOS17Features
//
//  Created by htcuser on 10/06/23.
//

import SwiftUI

struct ScrollTransition: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(1...30, id: \.self){ item in
                    Rectangle()
                        .frame(width: 200, height: 100)
                        .foregroundColor(.teal)
                        .cornerRadius(12)
                        .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive) { view, phase  in
                            view.opacity(1-(phase.value < 0 ? -phase.value : phase.value))
                        }
                }
            }
            
        }
    }
}

#Preview {
    ScrollTransition()
}
