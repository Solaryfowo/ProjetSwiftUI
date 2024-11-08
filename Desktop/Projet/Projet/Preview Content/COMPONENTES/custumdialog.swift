//
//  custumdialog.swift
//  Projet
//
//  Created by Sylvain Fowo on 06/11/2024.
//

import SwiftUI

struct customdialog<Content: View>: View {
    let closseDialog: ()->Void
    let ondismissOutside: Bool
    let content : Content
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .ignoresSafeArea()
                .onTapGesture {
                    if ondismissOutside {
                        
                        
                        closseDialog()
                    }
                }
            content.frame(width: UIScreen.main.bounds.size.width-100, height: 300)
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        closseDialog()
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                        }).foregroundColor(.blue).padding(19)
                        .font(.title)
                }
                
                    
                
            
            
        }.ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.size.width,
                   height: UIScreen.main.bounds.size.height,
                   alignment: .center)
        
    }
}


