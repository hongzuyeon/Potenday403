//
//  RecordImageCell.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct RecordImageCell: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.g50, lineWidth: 1)
                    .shadow(color: .grayShadow,
                            radius: 4,
                            x: 1, y: 1)
                
            )
            .overlay(
                Image("google_icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(.pink)
                    .padding([.top, .leading, .trailing], 14)
                    .padding(.bottom, 76)
            )
    }
}

struct RecordImageCell_Previews: PreviewProvider {
    static var previews: some View {
        RecordImageCell()
    }
}
