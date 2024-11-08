//
//  listacontac.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import SwiftUI

struct listacontac: View {
    var Contact : Contact
    @State private var searchText: String = ""
    var body: some View {
        
        VStack {
            Text(Contact.name)
                .fontWeight(.bold)
                .font(.title)
                .padding(.bottom, 10)
                .padding(EdgeInsets(top: 10, leading: -20, bottom: 10, trailing: 10))
            HStack {
                
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 60)
                        
                        .frame(width: 120, height: 145)
                        
                        .clipShape(Circle())
                    
                        .padding(EdgeInsets(top: 10, leading: -20, bottom: 10, trailing: 10))
                       
                       
                    Image(Contact.img)
                    
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 150)
                        .clipShape(Circle())
                        .padding(EdgeInsets(top: 10, leading: -20, bottom: 10, trailing: 10))
                    
                   
                    
                }
                Text(Contact.desciption)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding()
                    
            }
            .padding(EdgeInsets(top: 10, leading: -50, bottom: 10, trailing: 10))
            Spacer()
            VStack {
                TextField("Rechercher...", text: $searchText)
                    .font(.headline)
                    .foregroundColor(.black)
                
                    .padding()
                    .frame(width: 400, height: 60)
                
                    .background(Color.green)
                 .opacity(0.8)
                    .cornerRadius(35)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.gray)
                    .padding()
                    .frame(width: 400, height: 60)
                    .opacity(0.6)
                    .cornerRadius(100)
                    .padding()
                
            }
            
        }
        
        .padding(40)
    }
   
            }
        

    

#Preview {
    listacontac(Contact:Contact(name: "Leonarldo", desciption: "IL FAIT LA RANDONNÉE....", img: "imagen1" ))
        
}
