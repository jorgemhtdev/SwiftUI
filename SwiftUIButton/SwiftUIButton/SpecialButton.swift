//
//  SpecialButton.swift
//  SwiftUIButton
//
//  Created by jorgemht on 12/04/2020.
//  Copyright © 2020 jorgemht. All rights reserved.
//

import SwiftUI

struct SpecialButton: View {
    
    var buttonText = "Some Text"
    var buttonColor = Color("RedColor")
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5).frame(width: 150, height: 55).foregroundColor(Color("BGColor"))
            Text(buttonText).bold()
                .foregroundColor(Color.black)
                    
            LeftCorner()
                .trim(from: 0.41, to: 0.59)
            .fill(buttonColor)
            .frame(width: 150, height: 55)
        }
    }
}

struct LeftCorner: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: 5, height: 5))
        
        return path
    }
}

struct SpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        SpecialButton()
    }
}
