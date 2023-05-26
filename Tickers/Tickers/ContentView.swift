import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("clicked")
            }){
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.purple, lineWidth: 2)
                    .frame(width: 200, height: 20)
                    .overlay(Text("Não, me leve de volta!"))
                    .foregroundColor(.purple)
                
            }
            Button(action: {
                print("clicked2")
            }){
                RoundedRectangle(cornerRadius: 20)
                    .background()
                    .frame(width: 200, height: 20)
                    .overlay(Text("Pular pomodoro")
                        .foregroundColor(.white))
                    .foregroundColor(.purple)
                    
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
