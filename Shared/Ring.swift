//
//  RingView.swift
//  DesignExample
//
//  Created by Пятин Дмитрий on 08.10.2020.
//

import SwiftUI

struct RingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var percent: CGFloat = 45
    var color1 = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    var width: CGFloat = 60.0
    
    
    @State var show: Bool
    @Binding var allWater: CGFloat
    
    var body: some View {
        
        let multiplier = width / 15
        let progress = 1 - percent/100
        let water = allWater * percent / 100
        
        return ZStack {
            
            Circle()
                .stroke((colorScheme == .dark ? Color.gray: Color.black.opacity(0.2)), style: StrokeStyle(lineWidth: 5 * multiplier, lineJoin: .round))
                .frame(width: width * multiplier, height: width * multiplier)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .leading),
                      style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round))
                
                .animation(Animation.easeInOut(duration: 0.8))
                .rotationEffect(.degrees(180))
                .rotation3DEffect(.degrees(180),axis: (x: 1.0, y: 1.0, z: 0.0))
                .frame(width: width * multiplier, height: width * multiplier)
                .shadow(color: color2.opacity(0.1), radius: 3 * multiplier  , x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3 * multiplier)
            
            
            VStack {
                Text("\(Int(water)) мл.")
                    .font(.system(size: 8 * multiplier))
                    .fontWeight(.bold)
                Text("\(Int(percent))%")
                    .font(.system(size: 12 * multiplier))
                    .fontWeight(.bold)
            }
            
            .foregroundColor(colorScheme == .dark ? color1: color2)
            
            
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: true, allWater: .constant(500))
        //  .preferredColorScheme(.dark)
    }
}
