import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HallucinationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Anti-Hallucination AI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // Main content will go here
                Text("AI Hallucination Detection System")
                    .font(.headline)
                    .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
} 