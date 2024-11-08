//
//  setting.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import SwiftUI

struct setting: View {
    
       
    @AppStorage("isDarkMode") private var isDarkMode = true
@State private var notificationsEnabled: Bool = true
@State private var isGeolocationEnabled: Bool = true
@State private var username: String = "Usuario123"
@State private var password: String = ""

            var body: some View {
                NavigationView {
                    Form {
                Section(header: Text(" Général")) {
                            Toggle("Mode nuit", isOn: $isDarkMode)
                       
                    Toggle("Notifications", isOn: $notificationsEnabled)
                Toggle("Géolocalisation", isOn: $isGeolocationEnabled)
                        }
                        
                Section(header: Text("Compte")) {
                TextField("Nom d'utilisateur", text: $username)
            SecureField("Mot de passe", text: $password)
                            
        Button("Mettre à jour le mot de passe") {
                                // Aquí podrías llamar a una función para actualizar la contraseña
                            }
                        }
                        
        Section(header: Text("À propos")) {
                            HStack {
                                Text("Version")
                                Spacer()
                                Text("1.0.0")
                                    .foregroundColor(.gray)
                            }
                            HStack {
                                Text("Développeur")
                                Spacer()
                                Text("Moreno,Jade,DJIBI,Sylvain")
                                    .foregroundColor(.gray)
                                
                            }.preferredColorScheme(isDarkMode ? .dark : .light)
                        }
            }
                    .navigationTitle("Paramètres")
                }
            }
        }

        struct SettingsView_Previews: PreviewProvider {
            static var previews: some View {
                setting()
           
            }
            
        }
    

#Preview {
    setting()
}

