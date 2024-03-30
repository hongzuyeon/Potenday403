//
//  RecordDetailView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct RecordDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // test
    let data = Array(1...6).map { "\($0)"}
    let rows = [GridItem(.adaptive(minimum: 320))]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 52)
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Spacer()
                            Text("1 / 6")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.g300)
                                .frame(alignment: .trailing)
                        }
                        .padding([.top, .trailing, .bottom], 16)
                        LazyHGrid(rows: rows, spacing: 8)  {
                            ForEach(data, id: \.self) { i in
                                RecordImageCell()
                            }
                        }
                    }
                    
                    
                }
                
            }
            .background(Color.mapBgColor)
        }
        .navigationTitle("내 여행").foregroundColor(.g900)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    print("edit button click")
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("backArrow")
                })
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("edit button click")
                }, label: {
                    Image("edit")
                })
            }
        }
        .safeAreaInset(edge: .top) {
            AccessoryView()
                .frame(height: 52)
        }
    }
}

struct RecordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecordDetailView()
    }
}

struct AccessoryView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("book")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.homeBgColor,
                                         lineWidth: 1))
                .frame(width: 32, height: 32)
                .padding(.trailing, 8)
            Text("김철수")
                .foregroundColor(.g900)
                .font(.system(size: 18, weight: .semibold))
            Spacer()
        }
        .padding(.leading, 16)
        .padding([.top, .bottom], 10)
        //
        .background(Color(uiColor: .systemGroupedBackground))
        .buttonStyle(.bordered)
        .controlSize(.mini)
    }
}
