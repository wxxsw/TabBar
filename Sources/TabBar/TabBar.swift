//
//  TabBar.swift
//  TabBar
//
//  Created by Gesen on 2020/2/23.
//  https://github.com/wxxsw/TabBar
//

import SwiftUI

@available(iOS 13.0, *)
public struct TabBar<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    
    private let model: TabBarModel<SelectionValue>
    private let content: Content
    
    public init(selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.model = TabBarModel(selection: selection)
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .environmentObject(model)
            
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    Spacer()
                    
                    Divider()
                    
                    BlurView(style: .prominent)
                        .frame(height: 49 + proxy.safeAreaInsets.bottom)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .overlayPreferenceValue(TabBarItemPreferenceKey.self, { preferences in
            VStack(spacing: 0) {
                Spacer()

                HStack(spacing: 0) {
                    ForEach(preferences) { preference in
                        preference.label
                            .frame(width: UIScreen.main.bounds.width / CGFloat(preferences.count))
                            .onTapGesture {
                                if let i = preference.index as? SelectionValue {
                                    self.model.selection = i
                                }
                            }
                    }
                }
                .frame(height: 44)
            }
        })
    }
}

@available(iOS 13.0, *)
extension TabBar where SelectionValue == Int {

    public init(@ViewBuilder content: () -> Content) {
        self.model = TabBarModel(selection: .constant(0))
        self.content = content()
    }

}

@available(iOS 13.0, *)
class TabBarModel<SelectionValue: Hashable>: ObservableObject {
    
    @Binding var selection: SelectionValue
    
    init(selection: Binding<SelectionValue>) {
        self._selection = selection
    }
}

@available(iOS 13.0, *)
struct BlurView: UIViewRepresentable {
    
    init(style: UIBlurEffect.Style) {
        self.style = style
    }
    
    private let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIView {
        let effect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: effect)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
