//
//  TrazzleNavBarPreferenceKey.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/27.
//

import Foundation
import SwiftUI

struct TrazzleNavBarTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


struct TrazzleNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    func trazzleNavigationTitle(_ title: String) -> some View {
        preference(key: TrazzleNavBarTitlePreferenceKey.self, value: title)
    }
    
    func trazzleNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: TrazzleNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func trazzleNavBarItems(title: String = "", hidden: Bool = false) -> some View {
        self
            .trazzleNavigationTitle(title)
            .trazzleNavigationBarBackButtonHidden(hidden)
    }
}
