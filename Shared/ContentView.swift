//
//  ContentView.swift
//  Shared
//
//  Created by Пятин Дмитрий on 16.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var percent:CGFloat = 0
    var allWater: CGFloat = 1000
    
    var body: some View {
        
        VStack {
            Text("Гидратация")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            HStack(spacing: 100) {
                Image(systemName: "gearshape.fill")
                Image(systemName: "drop.fill")
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .imageScale(.large)
            .padding()
            
            Text("Воды в сутки \(Int(allWater)) мл.")
            Spacer()
            RingView(percent: percent, show: true)
                .padding(.bottom, 60)
            VStack(spacing: 20) {
                HStack(spacing: 40) {
                    Button(action: {
                        self.percent = 150 * 100 / allWater
                    }, label: {
                        Text("150")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            
                    })
                    Button(action: {
                        self.percent = 250 * 100 / allWater
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
                    self.percent = 500 * 100 / allWater
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
            Spacer()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
