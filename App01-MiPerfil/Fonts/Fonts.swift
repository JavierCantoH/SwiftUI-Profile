//
//  Fonts.swift
//  App01-MiPerfil
//
//  Created by Luis Javier Canto Hurtado on 26/10/21.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("PatrickHand-Regular", size: 32 ))
            .foregroundColor(Color("Texto"))
    }
}

extension Font {
    public static func PatrickHand(size: CGFloat, weight: String) -> Font {
        return Font.custom("PatrickHand-\(weight)", size: size)
    }
}
