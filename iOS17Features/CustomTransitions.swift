//
//  CustomTransitions.swift
//  iOS17Features
//
//  Created by htcuser on 10/06/23.
//

import SwiftUI

struct CustomTransitions: View {
    @State var bounceView: Bool = false
    var body: some View {
        VStack{
            if bounceView{
                Rectangle()
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                    .foregroundColor(.purple)
                //custom transition
                    .transition(CreateCustomTransition())
                
            }
            
            Button(action: {
                withAnimation(.spring()) {
                    bounceView.toggle()
                }
            }, label: {
                Text("Button")
            })
            
        }
    }
}

#Preview {
    CustomTransitions()
}

//Creating Custom Transition

struct CreateCustomTransition: Transition{
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .rotation3DEffect(.init(degrees: phase.value * (phase == .willAppear ? -90.0:90.0)),
                
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
    }
    
    
}
