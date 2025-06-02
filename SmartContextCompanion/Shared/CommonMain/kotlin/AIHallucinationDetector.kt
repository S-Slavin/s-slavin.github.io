package com.smartcontextcompanion.shared

import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import java.util.*

@Serializable
data class DetectionResult(
    val id: String = UUID.randomUUID().toString(),
    val timestamp: Long = System.currentTimeMillis(),
    val input: String,
    val confidence: Double,
    val isHallucination: Boolean,
    val context: String
)

class AIHallucinationDetector {
    private val confidenceThreshold = 0.85
    private val maxHistorySize = 100
    private val detectionHistory = mutableListOf<DetectionResult>()
    
    var confidenceScore: Double = 0.0
    var isHallucinating: Boolean = false
    
    fun analyzeInput(input: String, context: String) {
        // TODO: Implement actual ML model integration
        val mockConfidence = Math.random()
        val result = DetectionResult(
            input = input,
            confidence = mockConfidence,
            isHallucination = mockConfidence < confidenceThreshold,
            context = context
        )
        
        updateDetectionHistory(result)
        updateState(result)
    }
    
    private fun updateDetectionHistory(result: DetectionResult) {
        detectionHistory.add(result)
        if (detectionHistory.size > maxHistorySize) {
            detectionHistory.removeAt(0)
        }
    }
    
    private fun updateState(result: DetectionResult) {
        confidenceScore = result.confidence
        isHallucinating = result.isHallucination
    }
    
    fun clearHistory() {
        detectionHistory.clear()
    }
    
    fun exportHistory(): String {
        return Json.encodeToString(ListSerializer(DetectionResult.serializer()), detectionHistory)
    }
} 