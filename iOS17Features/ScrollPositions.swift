//
//  ScrollPositions.swift
//  iOS17Features
//
//  Created by htcuser on 10/06/23.
//

import SwiftUI

struct ScrollPositions: View {
    let images: [String] = ["cat1", "cat2", "cat3", "cat4", "cat5"]
    @State var scrollToItem: String?
    var body: some View {
        GeometryReader{
            let size = $0.size
            ScrollView(.horizontal){
                LazyHStack(spacing: 25) {
                    ForEach (images, id: \.self) { item in
                        Image(item)
                            .resizable()
                            .frame (width: 300, height: 200)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, (size.width-300)/2)
                .scrollTargetLayout()
            }
            
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $scrollToItem)
        }
        .overlay(alignment: .bottom) {
            VStack{
                if let scrollToItem{
                    Text(scrollToItem )
                }
                Button(action: {
                  scrollToItem = "cat5"
                }, label: {
                    Text("scroll to cat5")
                })
            }
        }
    }
    
}
                            

#Preview {
    ScrollPositions()
}

