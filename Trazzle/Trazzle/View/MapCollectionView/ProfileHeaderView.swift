//
//  ProfileHeaderView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/29.
//
// https://trazzle.p-e.kr/api-docs#/

import SwiftUI

struct ProfileHeaderView: View {
    
    // test
    let data = Array(1...1000).map { "목록 \($0)"}
    let itemWidth: CGFloat = ((UIScreen.main.bounds.width / 2) - (16 * 2) - 7) / 2
    let columns = [GridItem(.adaptive(minimum: 160))]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    Image("book")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 68, height: 68)
                        .cornerRadius(68 / 2)
                    Spacer().frame(width: 15)
                    CountryStatisticView()
                        .frame(height: 68)
                }
                .padding(.top, 12)
                
                Spacer().frame(height: 16)
                HStack {
                    Text("김철수")
                        .foregroundColor(.g900)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("수집한 마그넷 수: 6")
                        .foregroundColor(.g500)
                        .font(.system(size: 12, weight: .light))
                        .frame(alignment: .bottomLeading)
                }
                Spacer().frame(height: 16)
                Text("철수의 세계 여행, 즐거웠던 기억을 기록해두자! 가나다라마바")
                    .foregroundColor(.g700)
                    .font(.system(size: 14, weight: .regular))
                Spacer().frame(height: 20)
            }
            .padding([.leading, .trailing], 16)
        }
        .background(.white)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
