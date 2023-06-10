//
//  AnimationCompleteCallback.swift
//  iOS17Features
//
//  Created by htcuser on 10/06/23.
//

import SwiftUI

struct AnimationCompleteCallback: View {
    @State var isAnimate: Bool = false
    var body: some View {
        VStack{
            if isAnimate{
                Image("cat2")
                    .resizable()
                    .frame(width: 300, height: 200)
                    .cornerRadius(12)
            }
            Button(action: {
                withAnimation(.easeInOut, completionCriteria: .logicallyComplete) {
                    isAnimate.toggle()
                } completion: {
                   print("animation completed")
                }

            }, label: {
                Text("animateView")
            })
        }
    }
}

#Preview {
    AnimationCompleteCallback()
}
