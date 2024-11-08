//
//  modalcontac.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import Foundation



struct Contact : Identifiable {
    var id = UUID()
    var name : String
    var desciption : String
    var img : String
    //var colorBg : Color
    
}

var Contacts = [
    Contact(name: "Leonardo", desciption: "IL FAIT LA RANDONNÉE.... ", img: "imagen1" ),
    Contact(name: "Salma Hayek", desciption: "Baie oblongue, fruit disposé en régime, de certaines espèces de bananiers, à peau jaune lorsqu'il est mûr, à pulpe comestible, farineuse et sucrée", img: "imagen2"),
    
    Contact(name: "Sofia", desciption: "Baies le plus souvent noires formant des grappes, pulpeuses, à la peau lisse, fortement aromatiques", img: "imagen3" ),
    
    Contact(name: "Antonio", desciption: "Baie rouge reconnaissable grâce à sa peau rouge et ses petites graines beiges, les akènes.", img: "imagen4"),
    
    Contact(name: "Tony", desciption: "Le melon est une espèce de plantes herbacées annuelles, originaire d'Afrique intertropicale, appartenant à la famille des Cucurbitacées", img: "imagen5"),
    
    Contact(name: "Morgan", desciption: "Fruit charnu, de forme quasi sphérique, déprimée au sommet et à la base, à pulpe homogène.", img: "imagen6")
]
