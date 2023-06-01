//
//  LvlProgressBarView.swift
//  Tickers
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct LvlProgressBarView: View {
    var maxProgress: Int
    var actualProgress: Int
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12)
                .foregroundColor(.blue)
            ProgressView(value: Double(actualProgress), total: Double(maxProgress))
                .frame(width: 68, height: 8.0)
                .scaleEffect(x:1, y: 2.5, anchor: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text("\(actualProgress)/\(maxProgress)").padding(.trailing, 0)
                .padding(.leading, 0).opacity(0.4)
                .font(.footnote)
                .bold()
        }
    }
    
    
}

struct LvlProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LvlProgressBarView(maxProgress: 10, actualProgress: 10)
    }
}
