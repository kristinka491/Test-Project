//
//  ButtonsControlView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct ButtonsControlView: View {
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                VStack(spacing: 0) {
                    Image("Heart")
                        .resizable()
                        .frame(width: 20, height: 17)
                        .padding(.bottom, 17)
                    
                    Image("Divider")
                        .resizable()
                        .frame(width: 11, height: 1)
                        .padding(.bottom, 15)
                    
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 15, height: 20)
                        .foregroundColor(.addButtonColor)
                    
                }
                .padding([.top, .bottom], 18)
                .padding([.leading, .trailing], 14)
                .background(Color.additionlButtonsColor)
                .cornerRadius(15)
                
                Spacer()
            }
            .padding(.top, 156)
        }
        .padding(.trailing, 34)
    }
}

struct ButtonsControlView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsControlView()
    }
}
