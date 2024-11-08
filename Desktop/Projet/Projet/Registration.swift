//
//  Registration.swift
//  Projet
//
//  Created by Sylvain Fowo on 06/11/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var city: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var isRegistered: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("enregistrement des utilisateurs")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Non", text: $firstName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                TextField("nom de famille", text: $lastName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                TextField("e-mail", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                TextField("Numéro de téléphone", text: $phoneNumber)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.phonePad)
                
                TextField("Pseudo", text: $city)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                SecureField("Mot de passe", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top)
                }
                
                Button(action: register) {
                    Text("Registrarse")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
                
                Spacer()
                
                NavigationLink(destination: tabview(), isActive: $isRegistered) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
    
    func register() {
        // Validación básica de los campos
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || phoneNumber.isEmpty || city.isEmpty || password.isEmpty {
            errorMessage = "Por favor, complete todos los campos."
            return
        }
        
        if !isValidEmail(email) {
            errorMessage = "Correo electrónico no válido."
            return
        }
        
        if password.count < 6 {
            errorMessage = "La contraseña debe tener al menos 6 caracteres."
            return
        }
        
        errorMessage = ""
        isRegistered = true // Activa la navegación a WelcomeView al completar el registro
        
        // Aquí podrías agregar lógica adicional para guardar los datos, como llamar a una API o almacenarlos localmente
    }
    
    func isValidEmail(_ email: String) -> Bool {
        // Expresión regular simple para validar correos electrónicos
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("¡Bienvenido! Registro completado.")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

#Preview {
    RegistrationView()
}
