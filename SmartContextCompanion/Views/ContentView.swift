import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Smart Context Companion")
                    .font(.largeTitle)
                    .padding()
                
                Text("Welcome to your AI assistant")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
} 