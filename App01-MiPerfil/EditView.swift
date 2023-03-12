//
//  EditView.swift
//  App01-MiPerfil
//
//  Created by Luis Javier Canto Hurtado on 26/10/21.
//

import SwiftUI

struct EditView: View {
    
    @Binding var matricula: String
    @Binding var birthday: Date
    @Binding var weight: Int
    @Binding var height: Double
    
    // Variable para darle formate a las variables tipo fecha
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack{
            Color("ColorAbajo")
            VStack{
                Text("Matricula: ")
                TextField("Matrícula", text: $matricula)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                // Date picker
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                    Text("\(dateFormat.string(from: birthday))")
                }
                .padding(.horizontal, 20)
                // Stepper para el peso
                Stepper(value: $weight, in: 40...120){
                    Text("Peso: \(weight)")
                }
                    .padding(.horizontal, 20)
                // Slider para la altura
                Text(String(format: "Altura: %.2f", height))
                Slider(value: $height, in: 1.30...2.30)
                    .padding(.horizontal, 20)
                Spacer()
            }
            .padding(.top, 100)
            .font(.PatrickHand(size: 28, weight: "Regular"))
            .foregroundColor(Color("Texto"))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct EditView_Previews: PreviewProvider {
    
    @State static var matricula: String = "A01731687"
    @State static var birthday: Date = Date()
    @State static var weight: Int = 77
    @State static var height: Double = 1.75
    
    static var previews: some View {
        EditView(matricula: $matricula, birthday: $birthday, weight: $weight, height: $height)
    }
}
