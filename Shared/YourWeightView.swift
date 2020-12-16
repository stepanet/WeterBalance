//
//  YourWeightView.swift
//  WeterBalance
//
//  Created by Пятин Дмитрий on 16.12.2020.
//

import SwiftUI

struct YourWeightView: View {
    
    @Binding var showWeigth: Bool
    @Binding var weigth: CGFloat
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
            
            Text("Ваш вес \(Int(weigth)) кг. \(percent)")
                .font(.title3)
                .padding(.bottom,25)
//            Slider(value: $weigth, in: 0...150, step: 1)
//                .padding(.horizontal,10)
//                .padding(.bottom,25)
            
            Slider(value: Binding(get: {
                            self.weigth
                        }, set: { newValue  in
                            self.weigth = newValue
                            self.percent = percent * (allWater / (newValue * 35))
                            self.allWater = newValue * 35
                        }), in: 0...150, step: 1)
            .padding(.horizontal,10)
            .padding(.bottom,25)
        }
        .frame(width: 300, height: 200)
        .background(Color(white: 1, opacity: 1))
        .cornerRadius(10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .offset(y: -700)
    }
}

struct YourWeightView_Previews: PreviewProvider {
    static var previews: some View {
        YourWeightView(showWeigth: .constant(true), weigth: .constant(100), allWater: .constant(500), percent: .constant(50))
            .offset(y: 500)
        ContentView()
    }
}
