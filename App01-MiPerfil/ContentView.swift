//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by Luis Javier Canto Hurtado on 26/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showEditView: Bool = false
    @State var matricula: String = "A01731687"
    @State var birthday: Date = Date()
    @State var weight: Int = 77
    @State var height: Double = 1.75
    
    // Variable para darle formate a las variables tipo fecha
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack{
            VStack(spacing:0){
                VStack{
                    ZStack{
                        Color("ColorArriba")
                        VStack{
                            Text("Javier Canto")
                            //  .font(.custom("PatrickHand-Regular", size: 44))
                                .modifier(TextModifier())
                        }
                    }
                }
                VStack{
                    ZStack{
                        Color("ColorAbajo")
                        VStack{
                            HStack{
                                Text("Matrícula: \(matricula)")
                            }
                            HStack{
                                Text("Fecha de nacimiento: \(dateFormat.string(from: birthday))")
                            }
                            HStack{
                                Text(String(format: "Peso: %d - Altura: %.2f", weight, height))
                            }
                            Button(action:{
                                showEditView = true
                            }, label:{
                                HStack{
                                    Image(systemName: "pencil.circle.fill")
                                        .font(.largeTitle)
                                    Text("Editar")
                                }
                                .padding()
                                .background(Color("ColorArriba"))
                                .cornerRadius(20)
                            })
                                .padding(.top, 20)
                        }
                        .font(.PatrickHand(size: 28, weight: "Regular"))
                        .foregroundColor(Color("Texto"))
                    }
                }
            }
            VStack{
                Image("swiftui")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.orange, style: StrokeStyle(lineWidth: 10))
                    )
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showEditView){
            EditView(matricula: $matricula, birthday: $birthday, weight: $weight, height: $height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
