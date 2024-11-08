//
//  loguinView.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import SwiftUI

struct loguinView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var isLoggedIn: Bool
    @Binding var errorMessage: String

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Nom d'utilisateur", text: $username)
                    .font(.headline)
                    .frame(width: 300, height: 60)
                    .background(Color.brown)
                    .cornerRadius(20.0)
                    .padding()
                
                SecureField("Mot de passe", text: $password)
                    .font(.headline)
                    .frame(width: 300, height: 60)
                    .background(Color.brown)
                    .cornerRadius(20.0)
                    .padding()
               
                Button(action: login) {
                        Text("Se connecter")
                            .padding()
                            .background(Color.brown)
                            .foregroundColor(.black)
                            .cornerRadius(20.0)
                    }
                
                .padding()
                
                // Mensaje de error en caso de credenciales incorrectas
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
               }

                // NavigationLink condicional basado en isLoggedIn
                NavigationLink(destination: tabview()){
                   
                    // Solo navega si isLoggedIn es true

                    EmptyView() // NavigationLink oculto hasta que esté activado
                }
            }
            NavigationLink{
                RegistrationView()
            }label: {
                
              //  Button(action: {
                    // Acción para crear un nuevo usuario
                    // Puedes agregar la lógica para crear cuenta aquí
              //  }) {
                    Text("Créer un compte")
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.black)
                        .cornerRadius(20.0)
              //  }
            }
            .padding()
        }
    }
    
    func login() {
        // Validación de credenciales
        if username == "ADMIN" && password == "PASSWORD" {
            isLoggedIn = true
            UserDefaults.standard.set(username, forKey: "username")
           // print("admin \(username) -- \(password)")
           
                
            
        } else  {
            errorMessage = "incorrect réessayez ou créer un compte"
        }
      
        
        
    }
}

#Preview {
    loguinView(username: .constant("ed"), password: .constant("ef"), isLoggedIn: .constant(false), errorMessage: .constant(""))
}
