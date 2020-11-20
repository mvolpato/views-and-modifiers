//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Michele Volpato on 20/11/2020.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State private var useRed = false

    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            self.useRed.toggle()
        }
        .foregroundColor(.white)
        .frame(width: 300, height: 200)
        .background(useRed ? Color.red : Color.blue)
        .watermarked(with: "I should go to sleep")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
