//
//  SoundScreenView.swift
//  Tickers
//
//  Created by userext on 29/05/23.
//

import SwiftUI


struct SoundScreenView: View {
    @State var selectedOption: String?
    @Binding var isPresentingSounds: Bool
    let options = ["Chuva", "Tempestade", "Água Corrente", "Lo-fi"]

    var body: some View {
            if #available(iOS 16.0, *) {
                bottomSheetContent
                    .presentationDetents([.height(250)])
            } else {
                bottomSheetContent
            }
    }
    
    var bottomSheetContent: some View {
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
                        isPresentingSounds = false
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
        .padding()
        .interactiveDismissDisabled()
    }
}

fileprivate struct SoundScreenBinding: View {
    @State var isPresentingSounds: Bool = true
    var body: some View {
        SoundScreenView(selectedOption: "sss", isPresentingSounds: $isPresentingSounds)
    }
}
struct SoundScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SoundScreenBinding()
    }
}
