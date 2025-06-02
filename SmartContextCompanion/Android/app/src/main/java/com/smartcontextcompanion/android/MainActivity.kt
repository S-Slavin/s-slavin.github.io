package com.smartcontextcompanion.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.smartcontextcompanion.shared.AIHallucinationDetector

class MainActivity : ComponentActivity() {
    private val detector = AIHallucinationDetector()
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    HallucinationDetectorScreen(detector)
                }
            }
        }
    }
}

@Composable
fun HallucinationDetectorScreen(detector: AIHallucinationDetector) {
    var inputText by remember { mutableStateOf("") }
    var contextText by remember { mutableStateOf("") }
    var isAnalyzing by remember { mutableStateOf(false) }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "AI Hallucination Detector",
            style = MaterialTheme.typography.h5,
            modifier = Modifier.padding(bottom = 16.dp)
        )
        
        OutlinedTextField(
            value = inputText,
            onValueChange = { inputText = it },
            label = { Text("Input Text") },
            modifier = Modifier
                .fillMaxWidth()
                .height(100.dp)
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        OutlinedTextField(
            value = contextText,
            onValueChange = { contextText = it },
            label = { Text("Context (Optional)") },
            modifier = Modifier
                .fillMaxWidth()
                .height(60.dp)
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Button(
            onClick = {
                isAnalyzing = true
                detector.analyzeInput(inputText, contextText)
                isAnalyzing = false
            },
            enabled = inputText.isNotEmpty() && !isAnalyzing,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(if (isAnalyzing) "Analyzing..." else "Analyze")
        }
        
        if (detector.confidenceScore > 0) {
            Spacer(modifier = Modifier.height(16.dp))
            
            Card(
                modifier = Modifier.fillMaxWidth(),
                elevation = 4.dp
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "Confidence Score: ${String.format("%.1f%%", detector.confidenceScore * 100)}",
                        style = MaterialTheme.typography.body1
                    )
                    
                    Text(
                        text = "Status: ${if (detector.isHallucinating) "Potential Hallucination" else "Likely Accurate"}",
                        style = MaterialTheme.typography.body1,
                        color = if (detector.isHallucinating) MaterialTheme.colors.error else MaterialTheme.colors.primary
                    )
                }
            }
        }
    }
} 