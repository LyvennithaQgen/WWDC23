//
//  CreateCustomAnimation.swift
//  iOS17Features
//
//  Created by htcuser on 10/06/23.
//

import SwiftUI

struct CreateCustomAnimation: View {
    @State var animate: Bool = false
    var body: some View {
        VStack{
            if animate{
                Circle()
                    .frame(width: 150)
                    .foregroundColor(.teal)
                    .animation(.easeInOut, value: 1)
            }
            Button(action: {
//                withAnimation {
//                    animate.toggle()
//                }
                //Adding custom animation
                withAnimation(.init(CreatingCustomAnimation())) {
                    animate.toggle()
                }
               
            }, label: {
                Text("Custom Animation")
            })
        }
    }
}

#Preview {
    CreateCustomAnimation()
}

//Creating Custom Animation

struct CreatingCustomAnimation: CustomAnimation{
    let duration: CGFloat = 1.0
    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        //this goes beyond screen as we have it as time
       // return value.scaled(by: time)
        //to avoid this
        if time > duration{return nil}
            return value.scaled(by: time)
    }
}
