//
//  SwiftfulUIView.swift
//  SwiftfulThirdPartyPackages
//
//  Created by Tirzaan on 10/21/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRecursiveUI

struct SomeItem: Identifiable {
    let id: String = UUID().uuidString
    let color: Color = .red
}

struct SwiftfulUIView: View {
    @State private var isActive: Bool = false
    @State private var selection: Int = 0
    @State private var showStretchyHeader: Bool = false
    @State private var items: [SomeItem] = [
        SomeItem(),
        SomeItem(),
        SomeItem(),
        SomeItem(),
        SomeItem(),
    ]
    
    func getSomeData() async throws -> String {
        try? await Task.sleep(for: .seconds(2))
        return "Some Data!"
    }
    
    var body: some View {
        NavigationStack {
            RootView(
                delegate: RootDelegate(
                    onApplicationDidAppear: {
                        
                    },
                    onApplicationWillEnterForeground: { notification in
                        
                    },
                    onApplicationDidBecomeActive: { notification in
                        
                    },
                    onApplicationWillResignActive: { notification in
                        
                    },
                    onApplicationDidEnterBackground: { notification in
                        
                    },
                    onApplicationWillTerminate: { notification in
                        
                    }
                ),
                content: {
                    VStack {
                        CountdownViewBuilder(
                            endTime: Date().addingTimeInterval(60 * 60 * 24),
                            displayOption: .timeAs_h_m_s) { string in
                                Text(string)
                            } onTimerEnded: {
                                
                            }
                        
                        AsyncViewBuilder {
                            try await getSomeData()
                        } content: { phase in
                            switch phase {
                            case .loading:
                                ProgressView()
                                    .padding(40)
                            case .success(let newData):
                                Text(newData)
                                    .padding(40)
                            case .failure:
                                Text("Error")
                            }
                        }
                        .onNotificationRecieved(name: UIApplication.didBecomeActiveNotification) { notification in
                            
                        }
                        
                        
                        LazyZStack(allowSimultaneous: false, selection: selection, items: 0..<4) { (value: Int) in
                            Rectangle()
                                .fill(
                                    value == 1 ? Color.red :
                                        value == 2 ? Color.blue :
                                        value == 3 ? Color.orange :
                                        value == 4 ? Color.green :
                                        Color.yellow
                                )
                                .overlay {
                                    Text("\(value)")
                                }
                                .transition(AnyTransition.slide.animation(.easeInOut).combined(with: AnyTransition.scale.animation(.easeInOut)))
                        }
                        .animation(.easeIn, value: selection)
                        .asButton(.tap) {
                            if selection < 4 {
                                selection += 1
                            } else {
                                selection = 0
                            }
                        }
                        
                        CustomProgressBar(
                            selection: 5.6,
                            range: 0...10,
                            backgroundColor: .gray,
                            foregroundColor: .black,
                            cornerRadius: 10,
                            height: 20
                        )
                        .redacted(if: isActive, style: .appear)
                        .padding(40)
                        
                        NonLazyVGrid(columns: 3, alignment: .leading, spacing: 16, items: items) { item in
                            if let item {
                                item.color
                                    .frame(height: 50)
                                    .frame(width: item.id == items.first?.id ? 50 : nil)
                            } else {
                                //                Color.clear
                                //                    .frame(height: 50)
                            }
                        }
                        .padding(40)
                        
                        Text("Hello, world")
                            .padding()
                            .withGradientBackgroundAnimatable(isActive: isActive, activeGradient: LinearGradient(colors: [Color.red, .blue], startPoint: .leading, endPoint: .trailing), defaultGradient: LinearGradient(colors: [Color.green, .orange], startPoint: .leading, endPoint: .trailing), cornerRadius: 10)
                            .asButton(scale: 0.9, opacity: 0.8, brightness: 0.2) {
                                withAnimation {
                                    isActive.toggle()
                                }
                            }
                            .readingFrame { frame in
                                
                            }
                            .withDragGesture(
                                [.vertical, .horizontal],
                                minimumDistance: 0,
                                resets: true,
                                rotationMultiplier: 2,
                                scaleMultiplier: 1.1) { dragOffset in
                                    
                                } onEnded: { dragOffset in
                                    
                                }
                        //                animation: Animation
                        //                rotationMultiplier: CGFloat
                        //                scaleMultiplier: CGFloat
                                .padding(25)
                        
                        AsyncButton {
                            try? await Task.sleep(for: .seconds(2))
                        } label: { isPerformingAction in
                            ZStack {
                                if isPerformingAction {
                                    ProgressView()
                                } else {
                                    Text("Hello world")
                                }
                            }
                        }
                        
                        NavigationLink("Show Stretchy Header") { StretchyHeader }
                    }
                    
                }
            )
        }
    }
    
    var StretchyHeader: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.green)
                        .overlay(
                            ZStack {
                                if #available(iOS 15.0, *) {
                                    AsyncImage(url: URL(string: "https://picsum.photos/800/800"))
                                }
                            }
                        )
                        .asStretchyHeader(startingHeight: 300)
                }
            }
        }
    }
}

#Preview {
    SwiftfulUIView()
}
