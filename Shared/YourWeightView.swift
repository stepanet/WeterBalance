//
//  YourWeightView.swift
//  WeterBalance
//
//  Created by Пятин Дмитрий on 16.12.2020.
//

import SwiftUI

struct YourWeightView: View {
    
    @ObservedObject var settings = UDSettings()
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var showWeigth: Bool
    @Binding var allWater: CGFloat
    @Binding var percent: CGFloat
    
    var body: some View {
        
        VStack {
            HStack{
                Spacer()
                Button(action: {
                    showWeigth.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .renderingMode(.original)
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .padding(4)
                        .cornerRadius(17)
                })
            }
            .padding(.bottom,25)
            
            Text("Ваш вес \(Int(self.settings.userWeigth)) кг.")
                .font(.title3)
                .padding(.bottom,25)
                .foregroundColor(colorScheme == .dark ? Color.black: Color.black)
            
            Slider(value: Binding(get: {
                CGFloat(self.settings.userWeigth)
            }, set: { newValue  in
                self.settings.userWeigth = Int(newValue)
                self.percent = percent * (allWater / (/*newValue*/ CGFloat(self.settings.userWeigth) * 35))
                self.allWater = newValue * 35
            }), in: 1...150, step: 0.5)
            .padding(.horizontal,10)
            .padding(.bottom,25)
        }
        .frame(width: 300, height: 200)
        .background(Color(white: 1, opacity: 1))
        .cornerRadius(10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct YourWeightView_Previews: PreviewProvider {
    static var previews: some View {
        YourWeightView(showWeigth: .constant(true),
                       allWater: .constant(1), percent: .constant(1))
        //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
        //  .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
