//
//  MockView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct MockView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.backgroundColor
            GeometryReader { reader in
                                Color.backgroundColor
                                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                                    .ignoresSafeArea()
                            }
            VStack {
                Spacer()
                Text(StringConstants.mockTitle)
                        .font(.montserrat(.bold, size: 20))
                Spacer()
            }
        }.background(ignoresSafeAreaEdges: .top)
    }
}

struct MockView_Previews: PreviewProvider {
    static var previews: some View {
        MockView()
    }
}
