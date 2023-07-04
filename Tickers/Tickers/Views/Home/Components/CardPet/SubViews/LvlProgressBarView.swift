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
    init(_ maxProgress: Int, _ actualProgress: Int) {
        self.maxProgress = maxProgress
        self.actualProgress = actualProgress
    }
    var body: some View {
        HStack {
            Image("levelUpIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 18)
            ProgressView(value: Double(actualProgress), total: Double(maxProgress))
                .frame(width: 68, height: 8.0)
                .scaleEffect(x:1, y: 2.5, anchor: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text("\(actualProgress)/\(maxProgress)").padding(.trailing, 0)
                .padding(.leading, 0).opacity(0.4)
                .font(.footnote)
        }.frame(maxWidth: 140, maxHeight: 20)
    }
    
    
}

struct LvlProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LvlProgressBarView(20, 13)
    }
}
