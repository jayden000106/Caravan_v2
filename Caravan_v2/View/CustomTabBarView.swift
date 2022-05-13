//
//  CustomTabBarView.swift
//  Caravan_v2
//
//  Created by 정지혁 on 2022/05/10.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @StateObject var tabData = TabViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        TabView(selection: $tabData.currentTab) {
            HomeView()
                .tag("Home")
            
            StopWatchView()
                .tag("StopWatch")
            
            BookView()
                .tag("Book")
            
            ProfileView()
                .tag("Profile")
        }
        .overlay(
            HStack {
                TabBarButton(title: "Home", image: "house")
                
                TabBarButton(title: "StopWatch", image: "house")
                
                TabBarButton(title: "Book", image: "books.vertical")
                
                TabBarButton(title: "Profile", image: "person")
            }
                .environmentObject(tabData)
            , alignment: .bottom
        )
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
            .previewDevice("iPhone 13 Pro")
    }
}

struct TabBarButton: View {
    var title: String
    var image: String
    
    @EnvironmentObject var tabData: TabViewModel
    
    var body: some View {
        Button(action: {
            tabData.currentTab = title
        }, label: {
            VStack {
                Image(systemName: image)
                Text(title)
            }
            .foregroundColor(tabData.currentTab == title ? .blue : .gray)
            .frame(maxWidth: .infinity)
        })
    }
}
