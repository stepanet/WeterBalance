//
//  ActivityRingView.swift
//  WeterBalance
//
//  Created by Пятин Дмитрий on 19.12.2020.
//

import SwiftUI

struct ActivityRingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var progress: Double
    var lineWidth: CGFloat
    var gradient: Gradient
    
    var color1 = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    @Binding var allWater: CGFloat
    
    var body: some View {
        var trimVar = 0.0
        let water = allWater * CGFloat(progress)
        
        // Main ring
        ZStack {
            //BackgrounRing
            Circle()
                .stroke((colorScheme == .dark ? Color.gray: Color.black.opacity(0.2)), style: StrokeStyle(lineWidth: lineWidth, lineJoin: .round))
                .frame(width: self.lineWidth * 6.8, height: self.lineWidth * 6.8 )
            
            VStack {
                Text("\(Int(water)) мл.")
                    .font(.system(size: 8 * lineWidth/8))
                    .fontWeight(.bold)
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 12 * lineWidth/8))
                    .fontWeight(.bold)
            }
            .foregroundColor(colorScheme == .dark ? color1: color2)
            
            Circle()
                .rotation(.degrees(-90))
                .trim(from: 0, to: CGFloat(progress))
                .stroke(
                    AngularGradient(gradient: gradient,
                                    center: .center,
                                    startAngle: .degrees(-90*2),
                                    endAngle: .degrees(progress * 360 - 90)),
                    style: .init(lineWidth: lineWidth, lineCap: .round)
                )
                .overlay(
                    GeometryReader { geometry in
                        // End round butt and shadow
                        Circle()
                            .fill(self.gradient.stops[1].color)
                            .frame(width: self.lineWidth, height: self.lineWidth)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                            .offset(x: min(geometry.size.width, geometry.size.height)/2)
                            .rotationEffect(.degrees(self.progress * 360 - 90))
                            .shadow(color: .black, radius: self.lineWidth/2, x: 0, y: 0)
                        
                        
                    }
                    .clipShape(
                        // Clip end round line cap and shadow to front
                        Circle()
                            .rotation(.degrees(-90 + self.progress * 360 - 0.5))
                            .trim(from: 0, to: progress == 0 ? 0 : 0.25)
                            .stroke(style: .init(lineWidth: self.lineWidth))
                    )
                )
                .scaledToFit()
                .padding(lineWidth/2)
                .animation(Animation.easeInOut(duration: 0.8))
        }
    }
}

struct ActivityRingView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRingView(progress: 0, lineWidth: 50, gradient: Gradient(colors: [.red, .blue]), allWater: .constant(100))
    }
}
