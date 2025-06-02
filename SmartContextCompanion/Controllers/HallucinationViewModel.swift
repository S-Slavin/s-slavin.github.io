import Foundation
import SwiftUI

class HallucinationViewModel: ObservableObject {
    private let detector = AIHallucinationDetector()
    
    @Published var inputText: String = ""
    @Published var contextText: String = ""
    @Published var isAnalyzing: Bool = false
    @Published var showHistory: Bool = false
    
    var confidenceScore: Double {
        detector.confidenceScore
    }
    
    var isHallucinating: Bool {
        detector.isHallucinating
    }
    
    var detectionHistory: [AIHallucinationDetector.DetectionResult] {
        detector.detectionHistory
    }
    
    func analyzeCurrentInput() {
        guard !inputText.isEmpty else { return }
        isAnalyzing = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.detector.analyzeInput(self.inputText, context: self.contextText)
            self.isAnalyzing = false
        }
    }
    
    func clearInput() {
        inputText = ""
        contextText = ""
    }
    
    func clearHistory() {
        detector.clearHistory()
    }
    
    func exportHistory() -> Data? {
        return detector.exportHistory()
    }
    
    func formatConfidenceScore() -> String {
        return String(format: "%.1f%%", confidenceScore * 100)
    }
} 