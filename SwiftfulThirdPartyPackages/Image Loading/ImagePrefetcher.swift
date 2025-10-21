//
//  ImagePrefetcher.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//


import SwiftUI
import SDWebImageSwiftUI

final class ImagePrefetcher {
    static let intstance = ImagePrefetcher()
    private let prefetcher = SDWebImagePrefetcher()
    
    private init() { }
    
    func startPrefetching(urls: [URL]?) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}
