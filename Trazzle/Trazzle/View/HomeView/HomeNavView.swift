//
//  HomeNavView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/27.
//

import SwiftUI

struct HomeNavView: View {
    var body: some View {
        ZStack {
            Color.white.opacity(0.6).ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Text("MY Travel")
                        .padding(.horizontal, 16)
                        .foregroundColor(.highlightGreen)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(alignment: .center)
                    Spacer()
                    Group {
                        Button(action: {
                            print("export button action")
                        },label: {
                            Image("export")
                                .frame(alignment: .trailing)
                        })
                        
                        Button(action: {
                            print("statistics button action")
                        },label: {
                            Image("statistics")
                                .frame(alignment: .trailing)
                        })
                        .padding(.trailing, 4)
                    }.frame(width: 48, height: 38)
                    
                }
                Spacer()
            }
        }
    }
}

struct HomeNavView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavView()
    }
}
