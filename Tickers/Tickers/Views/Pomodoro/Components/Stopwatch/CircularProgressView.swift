import SwiftUI

struct CircularProgressView: View {
    let lineWidth: CGFloat = 6
    let progress: Double
    
    func realProgress() -> Double {
        return 1 - progress
    }
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(red: 212/255, green: 226/255, blue: 248/255),
                lineWidth: lineWidth
            )
            Circle()
                .trim(from: 0, to: realProgress())
                .stroke(Color("blueColorPrimary"), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: realProgress())
            ballKnobView
        }
    }
    private var ballKnobView: some View {
        GeometryReader { geo in
            Circle()
                .fill(Color("blueColorPrimary"))
                .frame(width: 25, height: 25)
                .overlay(
                    Circle()
                        .fill(.white)
                        .padding(5)
                )
                .frame(
                    width: geo.size.width,
                    height: geo.size.height,
                    alignment: .center
                )
                .offset(x: geo.size.height / 2)
                .rotationEffect(.degrees((realProgress() * 360) - 90))
                .animation(.easeOut, value: realProgress())
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}
