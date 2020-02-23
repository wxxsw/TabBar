//
//  ContentView.swift
//  Demo
//
//  Created by Gesen on 2020/2/23.
//

import SwiftUI
import TabBar

struct ContentView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        NavigationView {
            TabBar(selection: $selection) {
                Text("微信")
                    .navigationBarTitle("微信", displayMode: .inline)
                    .navigationBarItems(trailing: Image(systemName: "plus.circle"))
                    .tabBarItem(0) { Item(index: $selection, style: .chat) }
                Text("联系人")
                    .navigationBarTitle("联系人", displayMode: .inline)
                    .navigationBarItems(trailing: Image(systemName: "person.badge.plus"))
                    .tabBarItem(1) { Item(index: $selection, style: .contact) }
                Text("发现")
                    .navigationBarTitle("发现", displayMode: .inline)
                    .tabBarItem(2) { Item(index: $selection, style: .discover) }
                Text("我")
                    .navigationBarHidden(true)
                    .tabBarItem(3) { Item(index: $selection, style: .me) }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private struct Item: View {
    
    enum Style: Int {
        case chat
        case contact
        case discover
        case me
    }
    
    @Binding var index: Int
    
    let style: Style
    
    var body: some View {
        VStack(spacing: 6) {
            Image(style.imageName + (index == style.rawValue ? "_selected" : ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 22)
            
            Text(style.text)
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(index == style.rawValue ? .green : .secondary)
        }
    }
}

extension Item.Style {
    
    var imageName: String {
        switch self {
        case .chat:     return "root_tab_chat"
        case .contact:  return "root_tab_contact"
        case .discover: return "root_tab_discover"
        case .me:       return "root_tab_me"
        }
    }
    
    var text: String {
        switch self {
        case .chat:     return "微信"
        case .contact:  return "通讯录"
        case .discover: return "发现"
        case .me:       return "我"
        }
    }
    
}
