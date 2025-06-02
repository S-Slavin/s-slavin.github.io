import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var aiResponse: String = ""
    @State private var confidenceScore: Double = 0.0
    @State private var citations: [String] = []
    @State private var isProcessing: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Input Section
                VStack(alignment: .leading) {
                    Text("Enter your question")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    TextEditor(text: $userInput)
                        .frame(height: 100)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                }
                .padding(.horizontal)
                
                // Submit Button
                Button(action: processInput) {
                    HStack {
                        if isProcessing {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                        Text(isProcessing ? "Processing..." : "Get AI Response")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(userInput.isEmpty || isProcessing)
                .padding(.horizontal)
                
                // Response Section
                if !aiResponse.isEmpty {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("AI Response")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(aiResponse)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        
                        // Confidence Score
                        HStack {
                            Text("Confidence Score:")
                                .font(.subheadline)
                            ProgressView(value: confidenceScore)
                                .progressViewStyle(LinearProgressViewStyle(tint: confidenceScoreColor))
                            Text("\(Int(confidenceScore * 100))%")
                                .font(.subheadline)
                        }
                        
                        // Citations
                        if !citations.isEmpty {
                            Text("Sources")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            ForEach(citations, id: \.self) { citation in
                                Text(citation)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("Anti-Hallucination AI")
        }
    }
    
    private var confidenceScoreColor: Color {
        switch confidenceScore {
        case 0.8...1.0:
            return .green
        case 0.6..<0.8:
            return .yellow
        default:
            return .red
        }
    }
    
    private func processInput() {
        isProcessing = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Example response
            aiResponse = "This is a simulated response from the AI model. The actual implementation would connect to the backend API for real-time fact-checking and response generation."
            confidenceScore = 0.85
            citations = [
                "Source 1: Example citation",
                "Source 2: Another reference"
            ]
            isProcessing = false
        }
    }
}

#Preview {
    ContentView()
} 