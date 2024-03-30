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
                                    NavigationLink(
                                        destination: RecordDetailView()) {
                                        TravelRecordCell()}
                                }
                                .background(.white)
                            }
                        }
                        .padding(.top, 8)
                    }
                    .padding([.leading, .trailing], 16)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        NavigationLink(
                            destination: {
                                SettingView() },
                            label: {
                                Label("Settings", systemImage: "gearshape")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 4)
                            })
                    }
                }
                .tint(.black)
            }
        }
    }
}
struct MapCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TravelRecordCollectionView()
    }
}
