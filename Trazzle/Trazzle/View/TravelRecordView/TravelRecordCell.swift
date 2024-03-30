//
//  TravelRecordCell.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct TravelRecordCell: View {
    var body: some View {
        VStack {
            Image("magnet")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 9)
            Text("가나다라마바사아자차카타파하")
                .multilineTextAlignment(.leading)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
        }
        .padding(.all, 16)
        .background(.clear)
    }
}

struct TravelRecordCell_Previews: PreviewProvider {
    static var previews: some View {
        TravelRecordCell()
    }
}
