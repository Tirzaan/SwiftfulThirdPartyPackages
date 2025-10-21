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

    var body: some View {
        Rectangle()
            .opacity(0.1)
            .overlay {
                SDWebImageLoader(url: url, aspectRatioMode: aspectRatioMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        aspectRatioMode: .fill
    )
}
