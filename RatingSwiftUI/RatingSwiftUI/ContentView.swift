//
//  ContentView.swift
//  RatingSwiftUI
//
//  Created by jorgemhtdev on 11/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var seleccionada = -1

    var body: some View {
        
        NavigationView {
            Form {
                HStack {
                    Text("Puntución: \(seleccionada + 1)")
                    Spacer()
                    RatingView(seleccionado: $seleccionada)
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
