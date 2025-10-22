//
//  SwiftfulRoutingView.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//

import SwiftUI
import Combine
import SwiftfulRouting

struct SwiftfulRoutingView: View {
    var body: some View {
        RouterView { router in
            MyHomeView(viewModel: MyHomeViewModel(router: router))
            /*
            //            Text("View 1")
            //                .onTapGesture {
            //                    router.showScreen(.push) { router2 in
            //                        Text("View 2")
            //                            .onTapGesture {
            //                                router2.showScreen(.sheet) { router3 in
            //                                    Text("View 3")
            //                                        .onTapGesture {
            //                                            router3.showScreen(.fullScreenCover) { router4 in
            //                                                Text("View 4")
            //                                                    .onTapGesture {
            //                                                        router4.dismissScreen()
            //                                                    }
            //                                            }
            //                                        }
            //                                }
            //                            }
            //                    }
            //                }
             */
        }
    }
}

final class MyHomeViewModel: ObservableObject {
    let router: AnyRouter
    
    init(router: AnyRouter) {
        self.router = router
    }
    
    func goToNextScreen() {
//        router.showScreen(.push) {
//            
//        } destination: { router2 in
//            MyThirdScreen(router: router2)
//        }
        let screen1 = AnyDestination(segue: .push, destination: { router in
            Text("Hello, world!")
                .onTapGesture {
                    router.showNextScreen()
                }
        })
        let screen2 = AnyDestination(segue: .sheet, destination: { router in
            Text("Another screen!")
                .onTapGesture {
                    router.showNextScreen()
                }
        })
        let screen3 = AnyDestination(segue: .push, destination: { router in
            Text("Third screen!")
                .onTapGesture {
//                    router.dismissScreens(count: 3)
//                    router.dismissAllScreens()
                    router.showNextScreenOrDismissEnvironment()
                }
        })
        
//        router.showScreens(destinations: [screen1, screen2, screen3])
        router.addScreensToQueue(destinations: [screen1, screen2, screen3])
        router.showNextScreen()
    }
    
    func showAlert() {
        router.showAlert(.alert, location: .currentScreen, title: "Title", subtitle: "subtltle") {
            Button("NO") {
                
            }
            Button("Cool") {
                
            }
        }
    }
}

struct MyHomeView: View {
//    @Environment(\.router) var router
//    let router: AnyRouter
    @StateObject var viewModel: MyHomeViewModel
    
    var body: some View {
        Button("Show Next Screen") {
            viewModel.goToNextScreen()
            
            
            

        }
        .navigationTitle("Home")
    }
}

struct MyThirdScreen: View {
//    @Environment(\.router) var router
    let router: AnyRouter
    
    var body: some View {
        Button("Button") {
            router.dismissScreen()
        }
        .navigationTitle("Screen 3")
    }
}

#Preview {
    SwiftfulRoutingView()
}
