//
//  ContentView.swift
//  Projet
//
//  Created by Moreno Michael  on 29/10/2024.
//


import SwiftUI
import MapKit

struct ContentView: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.352222),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    ))
    
    @State private var indice = 0

    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo con un degradado sutil que recuerde a la naturaleza
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.3), Color.brown.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                  
                VStack(spacing: 10) {
                    // Perfil de usuario
                    HStack {
                        Image("personcontac")
                            .resizable()
                            .frame(width: 115.0, height: 115.0)
                            .foregroundColor(Color.brown)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.green, lineWidth: 4))
                            .shadow(color: .green.opacity(0.8), radius: 10, x: 2, y: 5)

                        VStack(alignment: .leading) {
                            Text("Solary Fowo ")
                                .font(.largeTitle)
                                .foregroundColor(.primary)

                            Text("Niveau randonnée moyen")
                                .font(.title3)
                                .foregroundColor(.secondary)
                            Text("Toulouse")
                                .font(.headline)
                                .foregroundColor(.secondary)
                               
                        }
                    }
                    .padding()

                    // Mapa con decoración y sombra
                    NavigationLink {
                        maps1()
                    } label: {
                        Map(position: $position)
                            .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                            .frame(minWidth: 200, minHeight: 300)
                            .cornerRadius(15)
                            .shadow(color: .green, radius: 10, x: 0, y: 5)
                            .frame(width: 370, height: 360)
                            .padding( .trailing, 10)
                            .padding(.leading, 10)
                            .overlay(
                                VStack {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "leaf.fill")
                                            .font(.title)
                                            .foregroundColor(.green)
                                            .padding()
                                    }
                                    Spacer()
                                }
                            )
                    }
                    
                    // Lista de opciones
                    ForEach(listeDoptions) { listeDoptions in
                        NavigationLink {
                            MINI_OPTION(listeDoption: listeDoptions)
                        } label: {
                            HStack {
                                Image(listeDoptions.img)
                                    .resizable()
                                    .frame(width: 90, height: 70)
                                    .cornerRadius(10)
                                    .shadow(color: .green.opacity(0.7), radius: 8, x: 5, y: 5)
                                    .overlay(
                                        ZStack {
                                            Circle().fill(Color.white.opacity(0.3))
                                            Image(systemName: "sun.max.fill")
                                                .foregroundColor(.yellow)
                                                .offset(x: 15, y: -15)
                                        }
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text(listeDoptions.name)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                    Text(listeDoptions.description)
                                        .font(.title3)
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white.opacity(0.9))
                                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                            )
                        }
                    }
                    
                    // Información del clima
                    ZStack {
                        VStack {
                            Text("TOULOUSE")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("20°C")
                                .foregroundColor(.white)
                                .font(.title3)
                          
                        }
                        .padding()
                        .frame(width: 350, height: 90)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.brown, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(15)
                                .contrast(0.6)
                        )
                        .overlay(
                            Image(systemName: "cloud.sun.fill")
                                .font(.largeTitle)
                                .foregroundColor(.yellow)
                                .padding(.trailing, 20),
                            alignment: .topTrailing
                        ).padding( .trailing, 10)
                            .padding(.leading, 10)
                    }
                }
                .padding()
            }
                .ignoresSafeArea()
                .toolbar(.hidden, for: .navigationBar)


        }//.ignoresSafeArea()
       
    }
}

#Preview {
    ContentView()
}
