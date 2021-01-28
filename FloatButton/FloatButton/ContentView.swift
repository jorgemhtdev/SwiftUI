//
//  ContentView.swift
//  FloatButton
//
//  Created by jorgemhtdev on 22/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false

    var body: some View {
        NavigationView
        {
            ZStack{
                List(1...100, id: \.self){
                    i in Text("Some text \(i)")
                }
                
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        ExpandableButton(
                            primaryButtonItem: ExpandableButtonItem(Img: Image(systemName: "pencil")),
                            secondaryButtonItems: [
                                ExpandableButtonItem(Img: Image(systemName: "envelope"), action: {
                                    self.showAlert.toggle()
                                }),
                                ExpandableButtonItem(Img: Image(systemName: "iphone"), action: {
                                    self.showAlert.toggle()
                                }),
                            ]
                        )
                        .padding()
                    }
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Presionado"))
                })
            }
            .navigationBarTitle("Float Button")
            
        }
    }
}


// Definir una estructura para definir cada uno de los botones => Será de tipo Identifiable

struct ExpandableButtonItem: Identifiable {
  let id = UUID()
  let Img: Image
  var action: (()-> Void)? = nil// Otra propiedad que representara la acción cada vez que se ejecute el botón. Se ejecute cada vez que se presione el botón. Función sin parametro y no regresa ningún valor. Está funcion va a ser nula, si no  proporcionas una acción no va a pasar nada cuando presiona el botón
}

// Definir una estructura para representar todos los botones

struct ExpandableButton: View{
    
    // Definimos 2 propiedades para definir que botones vamos a tener en nuestro ExpandableButton
    
    let primaryButtonItem: ExpandableButtonItem
    let secondaryButtonItems: [ExpandableButtonItem]

    
    // Definimos 2 propiedades de los tamaños
    
    private let size: CGFloat = 75
    private var cornerRadius: CGFloat {
      get { size / 2 }
    }
    
    // Variable que mantiene el estado del ExpandableButtom
    
    @State private var isExpanded = false
    
    // Definimos la interfaz de nuestro panel
    
    var body: some View {
        VStack{
            if isExpanded{
                ForEach(secondaryButtonItems){
                    button in Button(action: {button.action?()}, label: {
                        button.Img
                            .foregroundColor(.black)
                            .font(Font.system(.title))
                    }).frame(width: self.size, height: self.size)
                }
            }
            
            Button(action: {
                withAnimation
                {
                    self.isExpanded.toggle()
                }
                self.primaryButtonItem.action?()
            }, label: {
                self.primaryButtonItem.Img
                    .foregroundColor(.red)
                    .font(Font.system(.largeTitle))
            }).frame(width: self.size, height: self.size)
        }
        .background(Color.white)
        .cornerRadius(cornerRadius)
        .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
