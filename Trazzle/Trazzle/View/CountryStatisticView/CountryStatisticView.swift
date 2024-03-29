//
//  CountryStatisticView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/28.
//

import SwiftUI

struct CountryStatisticView: View {
    // test data
    private let keys = ["travel", "countries", "world"]
    private let values = ["1", "2", "0.51%"]
    
    let isRecordView: Bool
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            HStack(spacing: .zero) {
                ForEach(Array(values.enumerated()), id: \.element) { (index, value) in
                    VStack {
                        let color: Color = isRecordView ? .g700 : .mainGreen
                        let size: CGFloat =  isRecordView ? 16 : 26
                        let weight: Font.Weight = isRecordView ? .medium : .semibold
                        
                        Text(value)
                            .font(.system(size: size,
                                          weight: weight))
                            .foregroundColor(color)
                        

                        let subtitleSize: CGFloat =  isRecordView ? 16 : 14
                        let subtitleWeight: Font.Weight = isRecordView ? .light : .medium
                        
                        Text(keys[index])
                            .font(.system(size: subtitleSize,
                                          weight: subtitleWeight))
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
        CountryStatisticView(isRecordView: true)
    }
}
