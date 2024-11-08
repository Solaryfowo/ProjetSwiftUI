//
//  maps.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import SwiftUI
import MapKit

struct maps1: View {
    @State var position = MapCameraPosition.region (MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.5664808, longitude: 1.3982688),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    ))
    
    @State var places: [Place] = []
    @State var showPopup: CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var fav: Bool = false
    @State var alert: Bool = false
    @State var help: Bool = false
    @State var showSheet: Bool = false
    @State private var destination: CLLocationCoordinate2D? = nil
    let height = stride(from: 0.5, through: 0.5, by: 0.1).map { PresentationDetent.fraction($0) }
    
    // Añadir estado para almacenar la ruta
    @State private var hikingRoute: MKPolyline?
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $position) {
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            if place.favorite {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                            } else if place.alert {
                                Image(systemName: "triangle.fill")
                                    .foregroundColor(Color.red)
                                    .font(.title)
                            } else if place.help {
                                Image(systemName: "figure.wave")
                                    .foregroundColor(Color.yellow)
                                    .font(.title2)
                            }
                        }
                    }
                    
                    // Mostrar la ruta de senderismo
                    if let hikingRoute = hikingRoute {
                        MapPolyline(hikingRoute)
                            .stroke(Color.green, lineWidth: 5)
                    }
                    // Mostrar la bandera de cuadros en el punto de destino
                        if let destination = destination {
                        Annotation("Fin de la Ruta", coordinate: destination) {
                        Image(systemName: "flag.pattern.checkered")
                        .foregroundColor(.black)
                                                   .font(.title)
                                           }
                                       }
                                   
                                   
                }
                .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        showPopup = coordinates
                    }
                }
                .overlay {
                    VStack {
                        Button("Show list") {
                            showSheet = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(16)
                        Spacer()
                    }
                }
            }
            
            if showPopup != nil {
                let view = VStack {
                   
                        Spacer()
                        Text("Ajouter un emplacement!").font(.title2).bold()
                        //  Spacer()
                        TextField("Nom de lieu", text: $name).padding(.bottom, 1)
                            .font(.title2)
                        
                        Toggle("Lieux favoris?", isOn: $fav)
                            .font(.title2)
                        Toggle("Alert", isOn: $alert)
                            .font(.title2)
                        Toggle("help", isOn: $help)
                        Spacer()
                            .navigationBarBackButtonHidden(true)
                        Button("Garder") {
                            savePlace(name: name, fav: fav, help: help, alert: alert, coordinates: showPopup!)
                            clearForm()
                            
                        }
                    
                    Button("Calculer un itinéraire") {
                        if let start = places.first?.coordinates, let end = showPopup {
                            calculateHikingRoute(from: start, to: end)
                            showPopup = nil
                        }
                        
                    }
                }
                customdialog(closseDialog: {
                    showPopup = nil
                }, ondismissOutside: false, content: view)
            }
            
        }.sheet(isPresented: $showSheet) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(places) { place in
                        VStack {
                            Text(place.name).font(.title2).bold()
                        }
                        .frame(width: 150, height: 150)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1)
                        }
                        .shadow(radius: 10)
                    }
                }
            }
            .presentationDetents(Set(height))
       
        }
    }
    
    // Función para guardar el lugar
    func savePlace(name: String, fav: Bool, help: Bool, alert: Bool, coordinates: CLLocationCoordinate2D) {
        let place = Place(id: UUID(), name: name, address: "", coordinates: coordinates, favorite: fav, alert: alert, help: help)
        places.append(place)
        
    }
    
    // Función para limpiar el formulario
    func clearForm() {
        name = ""
        fav = false
        help = false
        alert = false
        showPopup = nil
    }
    
    // Función para calcular la ruta de senderismo
    func calculateHikingRoute(from start: CLLocationCoordinate2D, to end: CLLocationCoordinate2D) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
        request.transportType = .walking // Tipo de transporte como senderismo
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let response = response, let route = response.routes.first else {
                print("Error calculando la ruta: \(error?.localizedDescription ?? "Desconocido")")
                return
            }
            hikingRoute = route.polyline // Almacena la ruta calculada
        }
    }
}

// Definición de la estructura Place (asegúrate de tener esta estructura definida)
struct Place: Identifiable {
    let id: UUID
    let name: String
    let address: String
    let coordinates: CLLocationCoordinate2D
    let favorite: Bool
    let alert: Bool
    let help: Bool
}

#Preview {
    maps1()
}
