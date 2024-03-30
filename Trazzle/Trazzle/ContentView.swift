//
//  ContentView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView(titleText: .constant(TrazzleConstants.launchTitleText))
            }
            .tabItem {
                Image("globe")
                    .renderingMode(.template)
                Text("홈")
            }
            NavigationStack {
                MapCollectionView()
            }
            .tabItem {
                Image("book")
                    .renderingMode(.template)
                Text("지도집")
            }
            
//            .toolbar(.hidden, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
//            .toolbarBackground(Color.white60, for: .navigationBar)
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.white, for: .tabBar)
        }
        .tint(.mainGreen)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
