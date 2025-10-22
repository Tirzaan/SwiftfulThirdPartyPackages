//
//  ContentView.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("SDWebImage") { SDWebImage() }
                NavigationLink("Kingfisher") { Kingfisher() }
                NavigationLink("Keychain-Swift") { KeychainSwiftView() }
                NavigationLink("Swiftful UI") { SwiftfulUIView() }
                NavigationLink("Swiftful Routing") { SwiftfulRoutingView() }
                NavigationLink("") { EmptyView() }
                NavigationLink("") { EmptyView() }
            }
            .navigationTitle("Third Party Packages")
        }
    }
}

#Preview {
    ContentView()
}
