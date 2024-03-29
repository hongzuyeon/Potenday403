//
//  MapCollectionView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/25.
//

import SwiftUI

struct MapCollectionView: View {
    
    // test
    let data = Array(1...1000).map { "목록 \($0)"}
    let itemWidth: CGFloat = ((UIScreen.main.bounds.width / 2) - (16 * 2) - 7) / 2
    let columns = [GridItem(.adaptive(minimum: 160))]
    
    
    var body: some View {
        ZStack {
            Color.mapBgColor.ignoresSafeArea()
            VStack {
                ZStack {
                    ProfileHeaderView()
                }.background(.white)
                
                Spacer()
                
                // grid
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 7)  {
                        ForEach(data, id: \.self) { i in
                            VStack {
                                Capsule()
                                    .fill(Color.yellow)
                                    .frame(height: 50)
                                Text(i)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .frame(height: .infinity)
                    .padding(.top, 8)
                    
                }
                .padding([.leading, .trailing], 16)
            }
            
        }
    }
}

struct MapCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MapCollectionView()
    }
}
