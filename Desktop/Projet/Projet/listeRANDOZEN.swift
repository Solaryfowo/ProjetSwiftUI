//
//  listeRANDOZEN.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import Foundation

struct listeDoption: Identifiable {
    var id = UUID() // Identificador único para la lista
    var name: String // Nombre del país
    var flag: String // Nombre del icono de bandera
    var img: String
    var description: String

}

var listeDoptions = [
   // listeDoption (name:"depart",  flag:"", img:"depart", description:"commencer la randonnée"),
                     
    listeDoption (name:"events",  flag:"", img:"events", description:"inscrivez-vous ou ajoutez des événements"),
//
//    listeDoption (name:"setting",  flag:"", img:"settings", description:""),
//
//    listeDoption (name:"",  flag:"", img:"", description:"")
//
]
