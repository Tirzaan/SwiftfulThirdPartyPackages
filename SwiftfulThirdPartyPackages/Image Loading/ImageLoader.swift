//
//  ImageLoader.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//


import SwiftUI
import SDWebImageSwiftUI

struct ImageLoader: View {
    let url: String
    let aspectRatioMode: ContentMode
    let useSDWebImage: Bool

    var body: some View {
        Rectangle()
            .opacity(0.1)
            .overlay {
                if useSDWebImage {
                    SDWebImageLoader(url: url, aspectRatioMode: aspectRatioMode)
                        .allowsHitTesting(false)
                } else {
                    KingfisherImageLoader(url: url, aspectRatioMode: aspectRatioMode)
                        .allowsHitTesting(false)
                }
                
            }
            .clipped()
    }
}

#Preview {
    ImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        aspectRatioMode: .fill,
        useSDWebImage: true
    )
}
