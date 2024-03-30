//
//  RecordImageCell.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct RecordImageCell: View {
    var body: some View {
//        RoundedRectangle(cornerRadius: 4)
//            .fill(Color.white)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.g50, lineWidth: 1)
//                    .shadow(color: .grayShadow,
//                            radius: 4,
//                            x: 1, y: 1)
//                    .frame(width: getBgSize().width,
//                           height: getBgSize().height)
//
//            )
//            .overlay(
                Image("google_icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(.pink)
                    .frame(width: getImageSize().width,
                           height: getImageSize().height)
                    .padding([.top, .leading, .trailing], 14)
                    .padding(.bottom, 76)
//            )
            
            
           
    }
    
    func getImageSize() -> CGSize {
        let width = UIScreen.main.bounds.width - 34 - 46
        return CGSize(width: width, height: width)
    }
    
    func getBgSize() -> CGSize {
        let width = UIScreen.main.bounds.width - 14 - 14
        let height = getImageSize().height + 12 + 76
        return CGSize(width: width, height: height)
    }
}

struct RecordImageCell_Previews: PreviewProvider {
    static var previews: some View {
        RecordImageCell()
    }
}
