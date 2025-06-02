import Foundation
import CoreML

class AIHallucinationDetector: ObservableObject {
    @Published var confidenceScore: Double = 0.0
    @Published var isHallucinating: Bool = false
    @Published var detectionHistory: [DetectionResult] = []
    
    private let confidenceThreshold: Double = 0.85
    private let maxHistorySize: Int = 100
    
    struct DetectionResult: Identifiable, Codable {
        let id: UUID
        let timestamp: Date
        let input: String
        let confidence: Double
        let isHallucination: Bool
        let context: String
    }
    
    func analyzeInput(_ input: String, context: String) {
        // TODO: Implement actual ML model integration
        // For now, using a mock implementation
        let mockConfidence = Double.random(in: 0.0...1.0)
        let result = DetectionResult(
            id: UUID(),
            timestamp: Date(),
            input: input,
            confidence: mockConfidence,
            isHallucination: mockConfidence < confidenceThreshold,
            context: context
        )
        
        updateDetectionHistory(result)
        updateState(result)
    }
    
    private func updateDetectionHistory(_ result: DetectionResult) {
        detectionHistory.append(result)
        if detectionHistory.count > maxHistorySize {
            detectionHistory.removeFirst()
        }
    }
    
    private func updateState(_ result: DetectionResult) {
        confidenceScore = result.confidence
        isHallucinating = result.isHallucination
    }
    
    func clearHistory() {
        detectionHistory.removeAll()
    }
    
    func exportHistory() -> Data? {
        return try? JSONEncoder().encode(detectionHistory)
    }
} 