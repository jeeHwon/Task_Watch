//
//  AddItem.swift
//  Task_Watch WatchKit Extension
//
//  Created by 지승원 on 2022/02/20.
//

import SwiftUI

struct AddItem: View {
    
    @State var memoText = ""
    
    // getting context from environment
    @Environment(\.managedObjectContext) var context
    
    // Presentation
    @Environment(\.presentationMode) var presentation
    
    // Edit Options
    var memoItem: Memo?
    
    var body: some View {
        
        VStack(spacing: 15){
            
            TextField("Recipes...", text: $memoText)
            
            Button(action: addMemo, label: {
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
        .navigationTitle("\(memoItem == nil ? "Add Cocktails" : "Update")")
        .onAppear(perform: {
            
            // Verifying it memo Item has data
            if let memo = memoItem{
                memoText = memo.title ?? ""
            }
        })
    }
    
    // Adding Memo
    
    func addMemo(){
        
        let memo = memoItem == nil ? Memo(context: context) : memoItem!
        
        memo.title = memoText
        memo.dataAdded = Date()
        
        // Saving
        do{
            try context.save()
            // if success
            // closing view
            presentation.wrappedValue.dismiss()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
    }
}
