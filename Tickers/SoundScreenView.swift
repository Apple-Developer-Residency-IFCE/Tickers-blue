//
//  SoundScreenView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI


struct SoundScreenView: View {
    @State private var showingSounds = false
    @State var ativado: String?
    let options = ["Chuva", "Tempestade", "Água Corrente", "Lo-fi"]
        
    var body: some View {
        Button("Sons") {
            showingSounds.toggle()
        }
        .sheet(isPresented: $showingSounds) {
            VStack(alignment: .leading){
                HStack{
                    Image("ButtonSons")
                    Text("Sons")
                }
                Divider()
                ForEach(options, id: \.self) { option in
                    RadioButtonView(text: option, isTapped: option == ativado)
                        .onTapGesture {
                            ativado = option
                        }
                }
            }
            .presentationDetents([.height(250)])
            .padding()
            
        }
    }
}


struct SoundScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SoundScreenView(ativado: "sss")
    }
}
