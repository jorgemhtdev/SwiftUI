//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by jorgemht on 12/04/2020.
//  Copyright © 2020 jorgemht. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            SpecialButton(buttonText: "Send", buttonColor: Color("BlueColor")).onTapGesture {
                    print("Hello, I click the button Send")
            }
            
            Button(action: {
                    print("Hello, I click the button Cancel")
            }, label: {
                SpecialButton(buttonText: "Cancel",
                              buttonColor: Color("RedColor"))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
