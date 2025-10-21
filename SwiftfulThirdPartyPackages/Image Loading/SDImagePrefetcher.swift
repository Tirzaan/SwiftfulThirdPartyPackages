//
//  ImagePrefetcher.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//


import SwiftUI
import SDWebImageSwiftUI

final class SDImagePrefetcher {
    static let instance = SDImagePrefetcher()
    private let prefetcher = SDWebImagePrefetcher()
    
    private init() { }
    
    func startPrefetching(urls: [URL]?) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}


import Kingfisher

final class KingfisherImagePrefetcher {
    static let instance = KingfisherImagePrefetcher()
    var prefetchers: [String:ImagePrefetcher] = [:]
    
    private init() { }
    
    func startPrefetching(urls: [URL]) {
        prefetchers[urls.description] = ImagePrefetcher(urls: urls)
        prefetchers[urls.description]?.start()
    }
    
    func stopPrefetching(urls: [URL]) {
        prefetchers[urls.description]?.stop()
    }
}
