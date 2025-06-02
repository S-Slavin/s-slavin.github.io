import SwiftUI

struct HallucinationDetectorView: View {
    @StateObject private var viewModel = HallucinationViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Input Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Input Text")
                            .font(.headline)
                        
                        TextEditor(text: $viewModel.inputText)
                            .frame(height: 100)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        Text("Context (Optional)")
                            .font(.headline)
                        
                        TextEditor(text: $viewModel.contextText)
                            .frame(height: 60)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    // Analysis Button
                    Button(action: viewModel.analyzeCurrentInput) {
                        HStack {
                            if viewModel.isAnalyzing {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            }
                            Text(viewModel.isAnalyzing ? "Analyzing..." : "Analyze")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .disabled(viewModel.inputText.isEmpty || viewModel.isAnalyzing)
                    .padding(.horizontal)
                    
                    // Results Section
                    if viewModel.confidenceScore > 0 {
                        VStack(spacing: 15) {
                            HStack {
                                Text("Confidence Score:")
                                Text(viewModel.formatConfidenceScore())
                                    .fontWeight(.bold)
                            }
                            
                            HStack {
                                Text("Status:")
                                Text(viewModel.isHallucinating ? "Potential Hallucination" : "Likely Accurate")
                                    .fontWeight(.bold)
                                    .foregroundColor(viewModel.isHallucinating ? .red : .green)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    
                    // History Button
                    Button(action: { viewModel.showHistory.toggle() }) {
                        Text("View History")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray5))
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("AI Hallucination Detector")
            .sheet(isPresented: $viewModel.showHistory) {
                HistoryView(history: viewModel.detectionHistory)
            }
        }
    }
}

struct HistoryView: View {
    let history: [AIHallucinationDetector.DetectionResult]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(history) { result in
                VStack(alignment: .leading, spacing: 8) {
                    Text(result.input)
                        .font(.headline)
                    
                    HStack {
                        Text("Confidence: \(String(format: "%.1f%%", result.confidence * 100))")
                        Spacer()
                        Text(result.isHallucinating ? "Hallucination" : "Accurate")
                            .foregroundColor(result.isHallucinating ? .red : .green)
                    }
                    .font(.subheadline)
                    
                    Text(result.timestamp, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Detection History")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    HallucinationDetectorView()
} 