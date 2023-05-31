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
                .foregroundColor(.blue)
                .padding(.trailing, 5)
            ProgressView(value: Double(actualProgress), total: Double(maxProgress))
                .frame(width: 130, height: 12.0)
                .scaleEffect(x:1, y: 2.5, anchor: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text("\(actualProgress)/\(maxProgress)").padding(.trailing, 0)
                .padding(.leading, 0).opacity(0.3)
                .bold()
        }
    }
    
    
}

struct LvlProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LvlProgressBarView(maxProgress: 10, actualProgress: 10)
    }
}
