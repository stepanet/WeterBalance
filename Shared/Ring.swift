//
//  RingView.swift
//  DesignExample
//
//  Created by Пятин Дмитрий on 08.10.2020.
//

import SwiftUI

struct RingView: View {
    
    var percent: CGFloat = 0
    var color1 = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    var width: CGFloat = 60.0
    //var heigth: CGFloat = 30.0
    
    @State var show: Bool
    
    var body: some View {
        
        let multiplier = width / 15
        let progress = 1 - percent/100
        
    return ZStack {
            
            Circle()
                .stroke(Color.black.opacity(0.3), style: StrokeStyle(lineWidth: 5 * multiplier, lineJoin: .round))
                .frame(width: width * multiplier, height: width * multiplier)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .leading), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round))
                .animation(Animation.easeInOut(duration: 0.8))
                .rotationEffect(.degrees(178))
                .rotation3DEffect(.degrees(180),axis: (x: 1.0, y: 1.0, z: 0.0))
                .frame(width: width * multiplier, height: width * multiplier)
                .shadow(color: color2.opacity(0.1), radius: 3 * multiplier  , x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3 * multiplier)
                
                
            Text("\(Int(percent))%")
                .fontWeight(.bold)
                .font(.system(size: 14 * multiplier))
                
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: true)
    }
}
