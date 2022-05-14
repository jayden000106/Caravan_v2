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
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(height: 60)
                
                HStack {
                    TabBarButton(title: "Home", image: "house")
                    
                    TabBarButton(title: "StopWatch", image: "stopwatch")
                    
                    TabBarButton(title: "Book", image: "books.vertical")
                    
                    TabBarButton(title: "Profile", image: "person")
                }
                    .environmentObject(tabData)
            }
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
            ZStack {
                Circle()
                    .frame(width: 18, height: 18)
                    .foregroundColor(tabData.currentTab == title ? .orange : .white)
                    .padding(.bottom, 10)
                
                VStack(spacing: 0) {
                    Image(systemName: image)
                        .font(.system(size: 24, weight: .semibold))
                        .frame(height: 29)
                    
                    Text(title)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundColor(tabData.currentTab == title ? .black : .gray)
                .frame(maxWidth: .infinity)
            }
        })
    }
}
