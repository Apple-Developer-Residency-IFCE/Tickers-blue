//
//  NavigationBar.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 07/06/23.
//

import SwiftUI

fileprivate struct Home: View {

    var body: some View {
        NavigationView{
            Text("Home")
        }.navigationHome(leadingText: "leadingText", trailingText: "trailingText")
    }
}

fileprivate struct Custom: View {

    var body: some View {
        NavigationView{
            Text("Custom")
        }.navigationCustom(leadingText: "leadingText", trailingText: "trailingText")
    }
}

fileprivate struct NavigationBar: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    Home()
                } label: {
                    Text("Home")
                }.padding()
                
                NavigationLink {
                    Custom()
                } label: {
                    Text("Custom")
                }.padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}



