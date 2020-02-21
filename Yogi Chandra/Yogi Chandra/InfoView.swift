//
//  InfoView.swift
//  Yogi Chandra
//
//  Created by owner on 10/2/20.
//  Copyright © 2020 yogichandras. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let icon: String
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50.0)
            .foregroundColor(.white)
            .overlay(HStack{
                Image(systemName: icon).foregroundColor(Color(red:0.20, green:0.60, blue:0.86))
                Text(text).foregroundColor(.black)
            })
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(icon: "phone.fill", text: "+62 8953 8956 6001")
            .previewLayout(.sizeThatFits)
    }
}
