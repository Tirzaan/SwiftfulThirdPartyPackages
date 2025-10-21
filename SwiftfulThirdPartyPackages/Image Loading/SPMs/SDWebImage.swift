//
//  SDWebImage.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageLoader: View {
    let url: String
    let aspectRatioMode: ContentMode

    init(url: String, aspectRatioMode: ContentMode = .fill) {
        self.url = url
        self.aspectRatioMode = aspectRatioMode
    }
    
    var body: some View {
        WebImage(url: URL(string: url)) { image in
            image
                .resizable()
        } placeholder: {
            Color.gray.opacity(0.3)
        }
        .onSuccess { platformImage, data, SDImageCacheType in
            
        }
        .onFailure { error in
            
        }
        .indicator(.activity)
        .aspectRatio(contentMode: aspectRatioMode)
    }
}

struct SDWebImage: View {
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/237/200/300",
            aspectRatioMode: .fill,
            useSDWebImage: true
        )
        .frame(width: 300, height: 300)
        .onAppear {
            guard let url = URL(string: "https://picsum.photos/id/237/200/300") else { return }
            SDImagePrefetcher.instance.startPrefetching(urls: [url])
        }
    }
}

#Preview {
    SDWebImage()
}
