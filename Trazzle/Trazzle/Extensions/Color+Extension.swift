//
//  Color+Extension.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/26.
//

import SwiftUI

extension Color {
    
    // Colors
    static var mainGreen: Color {
        return Color(hex: "#49BA60")
    }
    
    static var mainOrange: Color {
        return Color(hex: "#FF9F2F")
    }
    
    static var mainBlue: Color {
        return Color(hex: "#8ACCF6")
    }
    
    static var highlightGreen: Color {
        return Color(hex: "005D10")
    }
    
    static var textBlack: Color {
        return Color(hex: "121616")
    }
    
    static var homeBgColor: Color {
        return Color(hex: "C1C7CA")
    }
    
    static var mapBlankColor: Color {
        return Color(hex: "FDFDFD")
    }
    
    static var textGray: Color {
        return Color(hex: "697074")
    }
    
    static var navBlack: Color {
        return Color(hex: "343A3C")
    }
    
    static var g400: Color {
        return Color(hex: "878D96")
    }
    
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

