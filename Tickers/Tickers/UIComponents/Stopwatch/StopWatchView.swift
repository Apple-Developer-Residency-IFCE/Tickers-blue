import SwiftUI

struct StopWatchView: View {
    let initCounter: Int
    var actualCounter: Int
    var start: Bool
    
    var progress: Double {
        Double(actualCounter) / Double(initCounter)
    }
    
    var minuts: String {
        let minut = (initCounter - actualCounter)/60
        return minut < 10 ? "0\(minut)" : "\(minut)"
    }
    
    var seconds: String {
        let seconds = (initCounter - actualCounter) % 60
        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }
    
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: progress)
                VStack(spacing: 20) {
                    Text("\(minuts):\(seconds)")
                        .foregroundColor(Color("blueColorPrimary"))
                        .font(.system(size: 54, weight: .medium))
                        .bold().padding(.top, 40)
                    HStack {
                        Button {
                            // resetTimer()
                        } label: {
                            Image("ButtonReiniciar")
                        }.padding(10)
                        Button {
                            if(start == false) {
                                // StartTimer()
                            }else {
                                // stopTimer()
                            }
                        } label: {
                            if(start == true) {
                                Image("ButtonPause")
                                    .padding(.bottom, 10)
                            }else {
                                Image("ButtonPlayStopWatch")
                                    .padding(.bottom, 10)
                            }
                        }.padding(10)
                        Button {
                            // stepTimer()
                        } label: {
                            Image("ButtonNext")
                        }.padding(10)
                    }
                }
            }.frame(width: 280, height: 280)
            
        }
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        let counter = 420
        let start: Bool = false
        StopWatchView(initCounter: 500, actualCounter: counter, start: start)
    }
}
