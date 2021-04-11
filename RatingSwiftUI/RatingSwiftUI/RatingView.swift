//
//  RatingView.swift
//  RatingSwiftUI
//
//  Created by jorgemhtdev on 11/4/21.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var seleccionado : Int

    var body: some View {
        HStack(spacing: 6){
            ForEach(0..<5) {i in
                Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(self.seleccionado >= i ?
                                    .yellow : .black)
                .scaleEffect(self.seleccionado >= i ? 1.5 : 1.0)
                .onTapGesture {
                    self.seleccionado = i
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(seleccionado: .constant(0))
    }
}
