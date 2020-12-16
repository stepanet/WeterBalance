//
//  OtherView.swift
//  WeterBalance
//
//  Created by Пятин Дмитрий on 16.12.2020.
//

import SwiftUI

struct OtherView: View {
    
    @Binding var showOther: Bool
    @Binding var percent: CGFloat
    @Binding var allWater: CGFloat
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button(action: {
                    showOther.toggle()
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
            Text("Добавить воды \(Int(allWater * percent / 100)) мл.")
                .font(.title3)
                .padding(.bottom,25)
            //Slider(value: $percent)
            Slider(value: $percent, in: -0...100, step: 1)
                .padding(.horizontal,10)
                .padding(.bottom,25)
        }
        .frame(width: 300, height: 200)
        .background(Color(white: 1, opacity: 1))
        .cornerRadius(10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OtherView(showOther: .constant(true), percent: .constant(10), allWater: . constant(1))
        }
    }
}
