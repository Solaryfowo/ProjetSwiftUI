//
//  loguinpage.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import SwiftUI

struct loguinpage: View {
    
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var errorMessage: String = ""
    var body: some View {
        
        if !isLoggedIn {
            NavigationStack {
                ZStack{
                    Image("forest")
                    VStack {
                        Text("Bienvenue sur notre application")
                            .foregroundColor(Color.white)
                            .font(.title2)
                            .padding()
                            .shadow(color: .green, radius: 10, x: 5, y: 5)
                        
                        VStack {
                            
//                            NavigationLink(destination: tabview()){
//                                EmptyView()
//                            }
                            
                            loguinView(username: $username, password: $password, isLoggedIn: $isLoggedIn, errorMessage: $errorMessage)
                        }
                    }
                }
            }
        }  else {
            tabview()
        }
    }
}
    #Preview {
        loguinpage()


    }

