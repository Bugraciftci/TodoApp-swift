//
//  SmallAddButton.swift
//  ToDo
//
//  Created by Muhammed Buğra on 19.11.2023.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(Color.indigo)
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)



    }
}

#Preview {
    SmallAddButton()
}
