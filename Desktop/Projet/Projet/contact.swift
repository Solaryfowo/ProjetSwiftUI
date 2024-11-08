//
//  contact.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import SwiftUI

struct contact: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.3), Color.brown.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 2) {
                        // Campo de búsqueda con mejoras visuales
                        TextField("Rechercher...", text: $searchText)
                            .padding(15)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(25)
                            .padding(.horizontal)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        // Lista de contactos
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(Contacts) { Contact in
                                HStack(spacing: 15) {
                                    NavigationLink(destination: listacontac(Contact: Contact)) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 35)
                                                .fill(Color.white.opacity(0.9))
                                                .frame(width: 80, height: 80)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 3, y: 3)
                                            
                                            Image(Contact.img)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(Contact.name)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                                .fontWeight(.bold)
                                            
                                            Text(Contact.desciption)
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white.opacity(0.8))
                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 3, y: 3)
                                )
                            }
                        }
                        .padding()
                    }
                    .padding(.top, 20)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    contact()
}

