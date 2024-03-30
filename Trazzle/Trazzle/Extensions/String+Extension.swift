//
//  String+Extension.swift
//  Trazzle
//
//  Created by 홍주연 on 3/30/24.
//

import SwiftUI

extension String {
    
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
}
