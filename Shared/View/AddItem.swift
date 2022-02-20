//
//  AddItem.swift
//  Task_Watch WatchKit Extension
//
//  Created by 지승원 on 2022/02/20.
//

import SwiftUI

struct AddItem: View {
    
    @State var memoText = ""
    
    var body: some View {
        
        VStack(spacing: 15){
            
            TextField("Recipes...", text: $memoText)
            
            Button(action: {}, label: {
                Text("Save")
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("orange"))
                    .cornerRadius(15)
                
            })
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(memoText == "")
        }
        .navigationTitle("Add Cocktails")
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
    }
}
