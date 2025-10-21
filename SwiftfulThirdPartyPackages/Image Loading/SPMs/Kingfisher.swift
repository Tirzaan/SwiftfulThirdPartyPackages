//
//  Kingfisher.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//

import SwiftUI
import Kingfisher

struct KingfisherImageLoader: View {
    let url: String
    let aspectRatioMode: SwiftUI.ContentMode
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                Color.red
            }
            .resizable()
            .onProgress({ receivedSize, totalSize in
                
            })
            .onSuccess({ result in
                
            })
            .onFailure({ error in
                
            })
//            .cacheMemoryOnly()
            .aspectRatio(contentMode: aspectRatioMode)
    }
}

struct Kingfisher: View {
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/237/200/300",
            aspectRatioMode: .fill,
            useSDWebImage: false
        )
        .onAppear {
            guard let url = URL(string: "https://picsum.photos/id/237/200/300") else { return }
            KingfisherImagePrefetcher.instance.startPrefetching(urls: [url])
        }
        .frame(width: 350, height: 400)
    }
}

#Preview {
    Kingfisher()
}
