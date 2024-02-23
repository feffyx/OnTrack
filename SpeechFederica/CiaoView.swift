//
//  CiaoView.swift
//  SpeechFederica
//
//  Created by Federica Ziaco on 21/02/24.
//

import SwiftUI

import SwiftUI

struct CiaoView: View {
    @State private var isShowingAlert = false
    @State private var scrollViewOffset: CGFloat = 0
    @State private var contentHeight: CGFloat = 15
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<20) { index in
                        Text("Item \(index)")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .frame(minHeight: UIScreen.main.bounds.height)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                self.contentHeight = geometry.size.height
                            }
                    }
                )
                .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { offset in
                    self.scrollViewOffset = offset
                    if self.scrollViewOffset > self.contentHeight - UIScreen.main.bounds.height {
                        self.isShowingAlert = true
                    }
                }
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Fine della ScrollView raggiunta!"))
        }
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func backgroundPreferenceValue<V>(_ value: V.Type, key: ScrollViewOffsetPreferenceKey.Type) -> some View where V : View {
        self.background(GeometryReader { geometry in
            Color.clear
                .preference(key: key.self, value: geometry.frame(in: .global).minY)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CiaoView()
    }
}
