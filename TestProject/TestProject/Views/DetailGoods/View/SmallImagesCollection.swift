//
//  SmallImagesCollection.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct SmallImagesCollection: View {
    var imageURLS: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: 5) {
                ForEach(imageURLS, id: \.self) { item in
                    AsyncImage(url: URL(string: item)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 65, height: 37)
                    .cornerRadius(5)
                }
            }
        }
        .padding([.leading, .trailing], 76)
        .padding(.bottom, 28)
        .padding(.top, 35)
    }
}

struct SmallImagesCollection_Previews: PreviewProvider {
    static var previews: some View {
        SmallImagesCollection(imageURLS: [])
    }
}
