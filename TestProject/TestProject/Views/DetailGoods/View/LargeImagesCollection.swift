//
//  LargeImagesCollection.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-13.
//

import SwiftUI

struct LargeImagesCollection: View {
    var imageURLS: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 21) {
                    ForEach(imageURLS, id: \.self) { item in
                        AsyncImage(url: URL(string: item)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 328, height: 279)
                        .cornerRadius(10)
                    }
                }
                .padding(.leading, 24)
            }
        }
        .padding(.trailing, 34)
    }
}

struct LargeImagesCollection_Previews: PreviewProvider {
    static var previews: some View {
        LargeImagesCollection(imageURLS: [])
    }
}
