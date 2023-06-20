//
//  navigationViewModifier.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 14/06/23.
//

import SwiftUI

struct NavigationBarCustomModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    var leadingText: String = ""
    var trailingText: String = ""
    
    init(_ leadingText: String, _ trailingText: String) {
        self.leadingText = leadingText
        self.trailingText = trailingText
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("ButtonBack")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBarTextView(leadingText, trailingText)
                }
            }
    }
}

struct NavigationBarHomeModifier: ViewModifier {
    var leadingText: String = ""
    var trailingText: String = ""
    init(_ leadingText: String, _ trailingText: String) {
        self.leadingText = leadingText
        self.trailingText = trailingText
    }

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBarTextView(leadingText, trailingText)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        Text("Ainda não implementado")
                    } label: {
                        Image("ButtonMissoes")
                    }
                }
            }
    }
}

struct NavigationBarPreferencesModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    var leadingText: String = ""
    
    init(_ leadingText: String) {
        self.leadingText = leadingText
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBarTextView(leadingText).padding(.leading, 10)
                }
            }
    }
}

extension View {
    func navigationHome(leadingText: String, trailingText: String)-> some View{
        modifier(NavigationBarHomeModifier(leadingText, trailingText))
    }
    
    func navigationCustom(leadingText: String, trailingText: String) -> some View {
        modifier(NavigationBarCustomModifier(leadingText, trailingText))
    }
    
    func navigationPreferences(leadingText: String) -> some View {
        modifier(NavigationBarPreferencesModifier(leadingText))
    }
}
