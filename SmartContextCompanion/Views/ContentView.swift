import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Smart Context Companion")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Your AI-powered context assistant")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    isActive.toggle()
                }) {
                    Text(isActive ? "Stop" : "Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(isActive ? Color.red : Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
} 