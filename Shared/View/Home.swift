//
//  Home.swift
//  Task_Watch WatchKit Extension
//
//  Created by 지승원 on 2022/02/08.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        // Geometry Reader For geeting Frame
        
        GeometryReader{reader in
            
            let rect = reader.frame(in: .global)
            
            VStack(spacing: 15){
                
                HStack(spacing: 25){
                    
                    // Buttons
                    
                    NavButton(image: "plus", title: "Add", rect: rect, color: Color("pink"))
                    
                    NavButton(image: "trash", title: "Delete", rect: rect, color: Color("red"))
                }
                .frame(width: rect.width, alignment: .center)
                
                HStack(spacing: 25){
                    
                    // Buttons
                    
                    NavButton(image: "doc.plaintext", title: "View", rect: rect, color: Color("blue"))
                    
                    NavButton(image: "star", title: "Rating", rect: rect, color: Color("orange"))
                }
                .frame(width: rect.width, alignment: .center)
            }
            
        }
    }
}

struct NavButton: View {
    
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    var body: some View {
        VStack(spacing: 8){
            
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width / 3, height: rect.width / 3, alignment: .center)
                .background(color)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.white)
                
        }
    }
}

