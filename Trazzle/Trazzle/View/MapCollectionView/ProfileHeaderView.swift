//
//  ProfileHeaderView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/29.
//
// https://trazzle.p-e.kr/api-docs#/

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 15) {
                Image("book")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 68, height: 68)
                    .cornerRadius(68 / 2)
                CountryStatisticView()
            }
            .padding(.top, 12)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            HStack(spacing: 4) {
                Text("김철수")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.g900)
                    .padding(.top, 16)
                Text("수집한 마그넷 수: 6")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.g500)
                    .frame(alignment: .bottomLeading)
                Spacer()
            }
            Text("철수의 세계 여행, 즐거웠던 기억을 기록해두자! 가나다라마바")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.g700)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
