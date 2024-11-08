//
//  mapsmodel.swift
//  Projet
//
//  Created by Sylvain Fowo on 06/11/2024.
//

import Foundation
import MapKit

struct place: Identifiable {
    var id: UUID = UUID()
    var name: String
    var address: String
    var coordinates: CLLocationCoordinate2D
    var favorite: Bool
    var alert: Bool
    var help: Bool
}

