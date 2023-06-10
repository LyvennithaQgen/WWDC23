//
//  UpdatedOnChangeModifier.swift
//  iOS17Features
//
//  Created by htcuser on 10/06/23.
//

import SwiftUI

struct UpdatedOnChangeModifier: View {
    @State var value = "Hello"
    var body: some View {
        Button(action: {
            value = "Hey"
        }, label: {
            Text("CurrentValue: \(value)")
        })
        .onChange(of: value, initial: true) { oldValue, newValue in
            print(oldValue, newValue)
        }
    }
}

#Preview {
    UpdatedOnChangeModifier()
}
