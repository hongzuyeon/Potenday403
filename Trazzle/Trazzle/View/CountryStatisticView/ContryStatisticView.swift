//
//  ContryStatisticView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/28.
//

import SwiftUI

struct ContryStatisticView: View {
    // test data
    private var statistics = ["travel": "1", "countries": "1", "world": "0.51%"]
    
    var body: some View {
        HStack {
            Spacer().frame(width: 16)
            ForEach(Array(zip(statistics.keys, statistics.values)), id: \.0) { dic in
                VStack {
                    Text(dic.1.description)
                        .font(.system(size: 26))
                        .fontWeight(.heavy)
                        .foregroundColor(.mainGreen)
                        .frame(maxWidth: .infinity)
                    Spacer().frame(height: 12)
                    Text(dic.0.description)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.textGray)
                        .frame(maxWidth: .infinity)
                }
            }
            Spacer().frame(width: 16)
        }
    }
}

struct ContryStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        ContryStatisticView()
    }
}
