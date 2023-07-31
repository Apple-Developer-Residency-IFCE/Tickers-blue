import SwiftUI
import Combine

struct StopWatchView: View {
    @ObservedObject var viewModel = PomodoroViewModel.shared
    @Binding var restTime: Bool
    
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: progress)
                VStack(spacing: 20) {
                    Text("\(viewModel.minutes()):\(viewModel.seconds())")
                        .foregroundColor(Color("blueColorPrimary"))
                        .font(.system(size: 45, weight: .medium))
                        .bold().padding(.top, 40)
                    HStack {
                        Button {
                            viewModel.resetTimer(restTime: &restTime)
                        } label: {
                            Image("ButtonReiniciar")
                        }.padding(10)
                        Button {
                            if !viewModel.isTimerRunning {
                                viewModel.startTimer(restTime: &restTime)
                                
                            } else {
                                viewModel.stopTimer()
                            }
                        } label: {
                            if viewModel.isTimerRunning {
                                Image("ButtonPause")
                                    .padding(.bottom, 10)
                            } else {
                                Image("ButtonPlayStopWatch")
                                    .padding(.bottom, 10)
                            }
                        }.padding(10)
                        Button {
                            viewModel.skipBreak(restTime: &restTime)
                        } label: {
                            Image("ButtonNext")
                        }.padding(10)
//                            .disabled(currentState != .breakTime)
                        
                    }
                }
            }.frame(width: 240, height: 240)
        }
        .onReceive(
            viewModel.timer
        ) { _ in
            viewModel.runTimer(restTime: &restTime)
        }
        .onChange(of: viewModel.currentState) { newValue in
            if newValue == .work || newValue == .breakTime {
                viewModel.isTimerRunning = true
            } else {
                viewModel.isTimerRunning = false
            }
        }
    }
    
    var progress: Double {
        if viewModel.isBreakTimeStarted {
           return Double(viewModel.timeRemaining) / Double(viewModel.restTimer * 60)
        } else {
           return Double(viewModel.timeRemaining) / Double(viewModel.pomodoroTime * 60)
        }
    }
}



struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView(restTime: .constant(true))
    }
}
