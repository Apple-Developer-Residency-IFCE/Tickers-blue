//
//  SoundScreenView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI


struct SoundScreenView: View {
    @State private var showingSounds = false
    @State var selectedOption: String?
    
    let options = ["Chuva", "Tempestade", "Água Corrente", "Lo-fi"]
    
    var body: some View {
        Button("Sons") {
            showingSounds.toggle()
        }
        .sheet(isPresented: $showingSounds) {
            VStack(alignment: .leading){
                HStack(spacing: 0){
                    Image("ButtonSons")
                        .padding(.trailing, 12)
                    Text("Sons")
                        .font(Font.tickerFont(font: .bold, size: .xxxl))
                        .foregroundColor(.blue)
                    Spacer()
                    Image("ButtonExitPopups")
                        .onTapGesture {
                            showingSounds = false
                        }
                }
                Divider()
                ForEach(options, id: \.self) { option in
                    RadioButtonView(text: option, isTapped: option == selectedOption)
                        .onTapGesture {
                            selectedOption = option
                        }
                }
            }
            .presentationDetents([.height(250)])
            .padding()
            .interactiveDismissDisabled()
        }
    }
}


struct SoundScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SoundScreenView(selectedOption: "sss")
    }
}
