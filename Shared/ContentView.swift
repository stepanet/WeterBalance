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
    @State var weigth: CGFloat = 0
    @State var allWater: CGFloat = 0//объем воды 35мл на кг
    
    var body: some View {
        
        ZStack {
            YourWeightView(showWeigth: $showWeigth, weigth: $weigth,allWater: $allWater)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .offset(y: showWeigth ? 600 : 0)
                .animation(.easeInOut)
            VStack {
                Text("Гидратация")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                HStack(spacing: 50) {
                    Image(systemName: "gearshape.fill")
                    Button(action: {
                        self.showWeigth.toggle()
                    }, label: {
                        Image(systemName: "drop.fill")
                        //.renderingMode(.original)
                    })
                    Button(action: {
                        self.percent = 0
                    }, label: {
                        Image(systemName: "stop.fill")
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
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                
                            })
                            Button(action: {
                                self.percent = percent + 250 * 100 / allWater
                            }, label: {
                                Text("250")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color.gray)
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
                                    .background(Color.gray)
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
                                    .background(Color.gray)
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
