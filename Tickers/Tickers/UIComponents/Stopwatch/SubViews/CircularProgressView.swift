import SwiftUI

struct CircularProgressView: View {
    let lineWidth: CGFloat = 6
    let progress: Double
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(red: 212/255, green: 226/255, blue: 248/255),
                lineWidth: lineWidth
            )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color("blueColorPrimary"), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
            ballKnobView
        }
    }
    private var ballKnobView: some View {
        GeometryReader { knobGeo in
            Circle()
                .fill(Color("blueColorPrimary"))
                .frame(width: 25, height: 25)
                .overlay(
                    Circle()
                        .fill(.white)
                        .padding(5)
                )
                .frame(
                    width: knobGeo.size.width,
                    height: knobGeo.size.height,
                    alignment: .center
                )
                .offset(x: knobGeo.size.height / 2)
                .rotationEffect(.degrees((progress * 360) - 90))
                .animation(.easeOut, value: progress)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}
