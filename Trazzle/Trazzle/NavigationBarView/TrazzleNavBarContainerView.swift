//
//  TrazzleNavBarContainerView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/27.
//

import SwiftUI

struct TrazzleNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TrazzleNavBarView(showBackButton: showBackButton, title: title)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(TrazzleNavBarTitlePreferenceKey.self,
                            perform: { value in
            self.title = value
        })
        .onPreferenceChange(TrazzleNavBarBackButtonHiddenPreferenceKey.self,
                            perform: { value in
            self.showBackButton = !value
        })
    }
}

struct TrazzleNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TrazzleNavBarContainerView {
            ZStack {
                Color.purple.ignoresSafeArea()
                
                Text("hello world")
                    .foregroundColor(.white)
                    .trazzleNavigationTitle("new title")
                    .trazzleNavigationBarBackButtonHidden(true)
            }
        }
    }
}
