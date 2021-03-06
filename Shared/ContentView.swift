//
//  ContentView.swift
//  Shared
//
//  Created by Пятин Дмитрий on 16.12.2020.
//

import SwiftUI




struct ContentView: View {
    
    @ObservedObject var settings = UDSettings()
    @Environment(\.colorScheme) var colorScheme
    
    @State var percent: CGFloat = 0
    @State var showOther = false
    @State var showWeigth = false
    @State var allWater: CGFloat = 0
    
    var color1 = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    var frameSize: CGFloat = UIScreen.main.bounds.width - 64
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Гидратация")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .kerning(2)
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? color1: color2)
                    .padding(.bottom, 24)
                
                HStack(spacing: 80) {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.gray)
                    Button(action: {
                        self.showWeigth.toggle()
                        self.showOther = false
                    }, label: {
                        Image(systemName: "drop.fill")
                    })
                    Button(action: {
                        self.percent = 0
                        self.showOther = false
                        self.showWeigth = false
                    }, label: {
                        Image(systemName: "xmark.octagon.fill")
                    })
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .imageScale(.large)
                .padding()
                .background(color1)
                .cornerRadius(5)
                .foregroundColor(color2)
                .padding(.bottom,24)
                .shadow(radius: 3)
                .rotation3DEffect(
                    .init(degrees: -18),
                    axis: (x: showWeigth ? 5.0 : -50.0 , y: 0.0, z: 0.0)
                )
                
                
                Text("Желательное потребление воды в сутки \(Int(allWater)) мл.")
                    .kerning(3)
                    .padding(.horizontal, 24)
                    .padding(.bottom,24)
                    .multilineTextAlignment(.center)
                
                // RingView(percent: percent, show: true, allWater: $allWater)
                //    .padding(.bottom, 64)
                
                // PercentageRing(ringWidth: 25, percent: Double(percent) ,
                //                            backgroundColor: color1.opacity(0.2),
                //                            foregroundColors: [color1, color2])
                
                //
                ActivityRingView(progress: Double(percent/100), lineWidth: frameSize / 7.8, gradient: Gradient(colors: [color1, color2]), allWater: $allWater)
                    .frame(width: frameSize, height: frameSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 24)
                
                
                VStack(spacing: 20) {
                    HStack(spacing: 40) {
                        Button(action: {
                            self.percent = percent + 150 * 100 / allWater
                        }, label: {
                            Text("150мл")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(color1)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                            
                        })
                        Button(action: {
                            self.percent = percent + 250 * 100 / allWater
                        }, label: {
                            Text("250мл")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(color1)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        })
                    }
                    
                    HStack(spacing: 40) {
                        Button(action: {
                            self.percent = percent + 500 * 100 / allWater
                        }, label: {
                            Text("500мл")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .padding()
                                .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(color1)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                            
                        })
                        Button(action: {
                            self.showOther.toggle()
                        }, label: {
                            Text("Другое")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .padding()
                                .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(color2)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        })
                    }
                }
                .disabled(self.allWater == 0 ? true : false)
            }
            
            .onAppear(){
                self.allWater =  35 * CGFloat(self.settings.userWeigth) //объем воды 35мл на кг
            }
            
            YourWeightView(showWeigth: $showWeigth, allWater: $allWater, percent: $percent)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .offset(y: showWeigth ? 270 : 550)
                .animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration:0.3))
            
            OtherView(showOther: $showOther, percent: $percent, allWater: $allWater)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .offset(y: showOther ? 270 : 550)
                .animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.3))
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            //   .preferredColorScheme(.dark)
        }
    }
}
