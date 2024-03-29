//
//  CountryStatisticView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/28.
//

import SwiftUI

struct CountryStatisticView: View {
    // test data
    private var keys = ["travel", "countries", "world"]
    private var values = ["1", "2", "0.51%"]
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            HStack(spacing: .zero) {
                ForEach(Array(values.enumerated()), id: \.element) { (index, value) in
                    VStack {
                        Text(value)
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(.mainGreen)
                        Text(keys[index])
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.g500)
                    }
                    .foregroundColor(.yellow)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.all, 16)
            
        }
    }
}

struct ContryStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatisticView()
    }
}
