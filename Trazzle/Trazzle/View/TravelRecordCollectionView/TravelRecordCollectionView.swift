//
//  TravelRecordCollectionView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/25.
//

import SwiftUI

struct TravelRecordCollectionView: View {
    
    // test
    let data = Array(1...1000).map { "\($0)"}
    let columns = [GridItem(.adaptive(minimum: 160))]
    
    
    var body: some View {
        NavigationView {
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
                                    TravelRecordCell()
                                }
                                .background(.white)
                            }
                        }
    //                    .frame(height: .infinity)
                        .padding(.top, 8)
                    }
                    .padding([.leading, .trailing], 16)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button(
                        action: {
                        print("setting button click")
                    }, label: {
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                    })
                    .padding(.trailing, 4)
                }
            }
        }
    }
}

struct MapCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TravelRecordCollectionView()
    }
}
