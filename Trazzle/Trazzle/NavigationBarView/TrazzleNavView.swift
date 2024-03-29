//
//  TrazzleNavView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/27.
//

import SwiftUI

struct TrazzleNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            TrazzleNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
//            .toolbar(.hidden, for: .navigationBar)
        }
        .navigationViewStyle(.stack)
    }
}

struct TrazzleNavView_Previews: PreviewProvider {
    static var previews: some View {
        TrazzleNavView {
            Color.red.ignoresSafeArea()
        }
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
