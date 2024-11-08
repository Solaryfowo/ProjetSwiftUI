//
//  login2.swift
//  Projet
//
//  Created by Sylvain Fowo on 06/11/2024.
//

import SwiftUI

struct login2: View {
    @State var name = ""
    var body: some View {
       // NavigationStack {
            ZStack {
                
                Image("forest")
                VStack {
                    Image("logoRandozen")
                    
                    ZStack{
                        
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.3)
                            .cornerRadius(45)
                            .frame(width: 412, height: 576)
                        
                        VStack{
                            Text("Bienvenue sur notre application")
                                .foregroundStyle(.white)
                                .bold()
                        }
                        .frame(minWidth: 0, maxHeight: 538, alignment: .topLeading)
                        VStack(spacing: 0) {
                            
                            TextField("Entre ton nom", text: $name)
                                .foregroundColor(.black)
                                .background(.brown)
                                .font(.largeTitle)
                                .opacity(0.7)
                                .multilineTextAlignment(.center)
                                .cornerRadius(21)
                                .frame(width: 300 , height: 60)
                        }
                        .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                        VStack(spacing: 0) {
                            
                            TextField("Numero Telephone", text: $name)
                                .foregroundColor(.black)
                                .background(.brown)
                                .font(.largeTitle)
                                .opacity(0.7)
                                .multilineTextAlignment(.center)
                                .cornerRadius(21)
                                .frame(width: 300 , height: 60)
                        }
                        .frame(minWidth: 0, maxHeight: 250, alignment: .topLeading)
                        VStack(spacing: 0) {
                            
                            VStack{
                                Text("ou")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .frame(minWidth: 0, maxHeight: 90, alignment: .topLeading)
                                    .padding(.top, 60)
                            }
                            
                            
                           // NavigationLink {
                                Text("Ecran Register")
                         //   } label: {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(21)
                                        .frame(width: 200 , height: 60)
                                        .foregroundStyle(.brown)
                                        .opacity(0.7)
                                    Text("Créer un compte")
                                        .foregroundStyle(.white)
                                    
                               // }
                                
                                //                                        .frame(minWidth: 0, maxHeight: 0, alignment: .topLeading)
                                
                            }
                            
                            
                        }
                        
                        NavigationLink {
                          //  tabview()
                            //Text("Enter")
                        } label: {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(21)
                                
                                    .frame(width: 200 , height: 60)
                                    .foregroundStyle(.brown)
                                    .opacity(0.7)
                                Text("ENTRER")
                                    .foregroundStyle(.white)
                                
                            }
                            .padding(.top, 340)
                            //                                    .frame(minWidth: 0, maxHeight: 0, alignment: .topLeading)
                            
                        }
                    }
                }
            }
        }
    }
    
//}
        

        #Preview {
            login2()
        }

    

