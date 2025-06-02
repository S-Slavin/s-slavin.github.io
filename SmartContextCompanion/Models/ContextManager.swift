import Foundation

class ContextManager: ObservableObject {
    @Published var isActive: Bool = false
    @Published var currentContext: String = ""
    
    func startContextAnalysis() {
        isActive = true
        // TODO: Implement context analysis
    }
    
    func stopContextAnalysis() {
        isActive = false
        currentContext = ""
    }
    
    func updateContext(_ newContext: String) {
        currentContext = newContext
    }
} 