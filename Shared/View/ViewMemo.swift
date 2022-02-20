//
//  ViewMemo.swift
//  Task_Watch WatchKit Extension
//
//  Created by 지승원 on 2022/02/20.
//

import SwiftUI
import CoreData

struct ViewMemo: View {
    
    // Core Data Fetch Request
    
    // Were getting Memos At descending order by using added or modifed date
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dataAdded, ascending: false)], animation: .easeIn) var results : FetchedResults<Memo>
    
    var body: some View {
        
        List(results){item in
            HStack(spacing: 10){
                
                VStack(alignment: .leading, spacing: 3, content: {
                    
                    Text(item.title ?? "")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Text("Last Modified")
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    
                    Text(item.dataAdded ?? Date(),style: .date)
                        .font(.system(size: 8))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                })
                
                Spacer(minLength: 4)
                
                // Edit Button
                
                NavigationLink(
                    destination: AddItem(memoItem: item),
                    label: {
                        Image(systemName: "square.and.pencil")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color("orange"))
                            .cornerRadius(8)
                })
                .buttonStyle(PlainButtonStyle())

            }

        }
        .listStyle(CarouselListStyle())
        .overlay(
            
            Text(results.isEmpty ? "No Cocktail`s found" : "")
        )
        .navigationTitle("Cocktail`s")

    }
}

struct ViewMemo_Previews: PreviewProvider {
    static var previews: some View {
        ViewMemo()
    }
}
