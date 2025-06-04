import Foundation
import SwiftUI

class HallucinationViewModel: ObservableObject {
    @Published var isAnalyzing = false
    @Published var confidenceScore: Double = 0.0
    @Published var analysisResults: [String: Any] = [:]
    
    func analyzeText(_ text: String) {
        isAnalyzing = true
        // Analysis logic will be implemented here
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isAnalyzing = false
            self.confidenceScore = 0.85
            self.analysisResults = [
                "hallucination_probability": 0.15,
                "confidence": 0.85,
                "sources": ["source1", "source2"]
            ]
        }
    }
} 