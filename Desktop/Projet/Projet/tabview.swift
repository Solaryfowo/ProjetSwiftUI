//
//  tabview.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//

import SwiftUI

struct tabview: View {
   // @State  private var indice = 0
    var body: some View {
        TabView {
            
           
            ContentView()
                .tabItem {
                    
                    Image(systemName: "map")
                    
                    Text("MAPS")
                        
                }
            contact()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("CONTACT")
                }
            setting()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("SETTING")
                        
                }
//            options()
//                .tabItem {
//                    Image(systemName: "arrowshape.right.fill")
//                    Text("MORE")
//                }
        }.accentColor(.green)
    }
}
#Preview {
    tabview()
}

