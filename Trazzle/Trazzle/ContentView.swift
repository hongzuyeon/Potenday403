//
//  ContentView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                Group {
                    HomeView()
                        .tabItem {
                            Image("globe")
                                .renderingMode(.original)
                            Text("홈")
                    }
                    MapCollectionView()
                        .tabItem {
                            Image("book")
                                .renderingMode(.original)
                        Text("지도집")
                    }
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
            }
            .tint(.mainGreen)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
