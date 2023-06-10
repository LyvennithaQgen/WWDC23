//
//  ContentView.swift
//  iOS17Features
//
//  Created by htcuser on 09/06/23.
//

//MARK:- Swift Data

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query(FetchDescriptor(predicate: #Predicate { $0.isFav == false } ), animation: .bouncy) private var items: [ProductList]
    @Query(FetchDescriptor(predicate: #Predicate { $0.isFav == true } ), animation: .bouncy) private var favourites: [ProductList]
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    DisclosureGroup("New Products"){
                        ForEach(items) { item in
                            HStack{
                                Text(item.productName ?? "")
                                Spacer()
                                Button(action: {
                                    item.isFav?.toggle()
                                    try? context.save()
                                }, label: {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor((item.isFav ?? false) ? .red:.gray)
                                        
                                })
                            }
                        }
                    }
                    DisclosureGroup("Favouites"){
                        ForEach(favourites) { item in
                            HStack{
                                Text(item.productName ?? "")
                                Spacer()
                                Button(action: {
                                    item.isFav?.toggle()
                                    try? context.save()
                                }, label: {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor((item.isFav ?? false) ? .red:.gray)
                                })
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("My Products")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Item") {
                            let product = ProductList(productName: "My new Product")
                            context.insert(product)
                            do{
                                try context.save()
                            }catch{
                                print(error.localizedDescription)
                            }
                        }
                    }
                })
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

@Model
class ProductList{
    var productName: String?
    var isFav: Bool?
    
    init(productName: String?, isFav: Bool? = false) {
        self.productName = productName
        self.isFav = isFav
    }
}

/*
      Swift Data
      ScrollView New Paging API
      Reading Scroll Position
      Scroll Transitions
      Custom Transitions
      Custom Animations
      Animation Complete Callback
      Updated onChange Modifier
      Observable & Bindable
      UnEvenRoundedRectangle
      Haptics Feedback
      New VisualEffect Modifier
      Animated SFSymbols
      PhaseAnimator API
 */



