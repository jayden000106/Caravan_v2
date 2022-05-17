//
//  HomeView.swift
//  Caravan_v2
//
//  Created by 정지혁 on 2022/05/13.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Home")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("안녕하세요. " + "님")
                Text("오늘 하루\n책을 잠깐 들어보세요!")
            }
            .font(.title)
            .padding(.top, 40)
            
            Spacer()
        }
        .padding(20)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13 Pro")
    }
}
