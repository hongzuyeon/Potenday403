//
//  Backport.swift
//  Trazzle
//
//  Created by joomin on 3/28/24.
//

import Foundation
import SwiftUI

public struct Backport<Content> {
    public let content: Content
    
    public init(_ content: Content) {
        self.content = content
    }
}

extension View {
    var backport: Backport<Self> { Backport(self) }
}

extension Backport where Content: View {
    @ViewBuilder func scrollContentBackground(_ visibility: Visibility) -> some View {
        if #available(iOS 16, *) {
            content.scrollContentBackground(visibility)
        } else {
            content
        }
    }
}
