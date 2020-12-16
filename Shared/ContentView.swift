//
//  ContentView.swift
//  Shared
//
//  Created by Пятин Дмитрий on 16.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var percent: CGFloat = 0
    @State var showOther = false
    @State var showWeigth = false
    @State var weigth: CGFloat = 70
    @State var allWater: CGFloat = 0//объем воды 35мл на кг
    
    var color1 = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    var body: some View {
        
        ZStack {
            YourWeightView(showWeigth: $showWeigth, weigth: $weigth,allWater: $allWater, percent: $percent)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .offset(y: showWeigth ? 900 : 0)
                .animation(.easeInOut)
            VStack {
                Text("Гидратация")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .padding()
                HStack(spacing: 50) {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.gray)
                    Button(action: {
                        self.showWeigth.toggle()
                        self.showOther = false
                    }, label: {
                        Image(systemName: "drop.fill")
                            .foregroundColor(color2)
                        //.renderingMode(.original)
                    })
                    Button(action: {
                        self.percent = 0
                        self.showOther = false
                        self.showWeigth = false
                    }, label: {
                        Image(systemName: "stop.fill")
                            .foregroundColor(color2)
                        //.renderingMode(.original)
                    })
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .imageScale(.large)
                .padding()
                
                Text("Воды в сутки \(Int(allWater)) мл.")
                Spacer()
                RingView(percent: percent, show: true)
                    .padding(.bottom, 60)
                
                ZStack {
                    OtherView(showOther: $showOther, percent: $percent, allWater: $allWater)
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .offset(y: showOther ? 0 : 500)
                        .animation(.easeInOut)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 40) {
                            Button(action: {
                                self.percent = percent + 150 * 100 / allWater
                            }, label: {
                                Text("150")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(color1)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                
                            })
                            Button(action: {
                                self.percent = percent + 250 * 100 / allWater
                            }, label: {
                                Text("250")
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
                                Text("500")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .padding()
                                    .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(color2)
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
                    .offset(y: showWeigth ? 300 : 0)
                    .animation(.default)
                    
                }
                Spacer()
            }.blur(radius: showWeigth ? 1 : 0)
        }.onAppear(){
            self.allWater =  35 * weigth
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
