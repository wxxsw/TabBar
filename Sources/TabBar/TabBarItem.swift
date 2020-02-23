//
//  TabBarItem.swift
//  TabBar
//
//  Created by Gesen on 2020/2/23.
//  https://github.com/wxxsw/TabBar
//

import SwiftUI

@available(iOS 13.0, *)
extension View {

    public func tabBarItem<I: Hashable, V: View>(_ index: I, @ViewBuilder _ label: () -> V) -> some View {
        modifier(TabBarItemModifier(index: index, label: label()))
    }
    
}

@available(iOS 13.0, *)
struct TabBarItemModifier<SelectionValue: Hashable, Label: View>: ViewModifier {
    var index: SelectionValue
    var label: Label
    
    func body(content: Content) -> some View {
        Group {
            if index == model.selection {
                content
            } else {
                Color.clear
            }
        }
        .preference(key: TabBarItemPreferenceKey.self, value: [.init(index: index, label: AnyView(label))])
    }
    
    @EnvironmentObject var model: TabBarModel<SelectionValue>
}

@available(iOS 13.0, *)
struct TabBarItemPreferenceKey: PreferenceKey {

    struct Item: Identifiable {
        let id = UUID()
        let index: Any
        let label: AnyView
        
        init<V: View>(index: Any, label: V) {
            self.index = index
            self.label = AnyView(label)
        }
    }
    
    typealias Value = [Item]
    
    static var defaultValue: [Item] = []
    
    static func reduce(value: inout [Item], nextValue: () -> [Item]) {
        value.append(contentsOf: nextValue())
    }
}
