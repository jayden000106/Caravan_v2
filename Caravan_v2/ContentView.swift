//
//  ContentView.swift
//  Caravan_v2
//
//  Created by 정지혁 on 2022/05/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomTabBarView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
