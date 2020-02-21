//
//  ContentView.swift
//  Yogi Chandra
//
//  Created by owner on 10/2/20.
//  Copyright © 2020 yogichandras. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red:0.20, green:0.60, blue:0.86).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("yogi").resizable().aspectRatio(contentMode: .fit).frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Yogi Chandra Saputra")
                    .font(Font.custom("Sriracha", size: 30))
                    .bold()
                    .foregroundColor(.white)
                
                Text("Developer & Technopreneur")
                .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Divider()
                VStack{
                    InfoView(icon: "phone.fill", text: "+62 8953 8956 6001")
                    InfoView(icon: "envelope.fill", text: "yogey264@gmail.com")
                    InfoView(icon: "link", text: "www.yogichandra.com")
                }
                .padding(.all)

                 
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}


