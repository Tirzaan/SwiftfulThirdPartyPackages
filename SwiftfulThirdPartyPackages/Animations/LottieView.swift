//
//  LottieAnimView.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/22/25.
//

import SwiftUI
import Lottie

struct LottieHelperView: View {
    var fileName: String
    var contentMode: ContentMode = .fit
    var looMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
//            .playbackMode(.paused(at: .progress(0.6)))
            .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
            .animationSpeed(0.8)
            .animationDidFinish { completed in
                onAnimationDidFinish?()
            }
            .configure({ lottieAnimationView in
//                lottieAnimationView.
            })
            .aspectRatio(contentMode: contentMode)

    }
}

struct LottieAnimView: View {
    var body: some View {
        LottieHelperView(fileName: "StarAnimation", contentMode: .fit, looMode: .playOnce)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    LottieAnimView()
}
