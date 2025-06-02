import Foundation
import SwiftUI

class ContextViewModel: ObservableObject {
    private let contextManager = ContextManager()
    
    @Published var isActive: Bool {
        didSet {
            if isActive {
                contextManager.startContextAnalysis()
            } else {
                contextManager.stopContextAnalysis()
            }
        }
    }
    
    @Published var currentContext: String = ""
    
    init() {
        self.isActive = false
    }
    
    func toggleActive() {
        isActive.toggle()
    }
    
    func updateContext(_ newContext: String) {
        contextManager.updateContext(newContext)
        currentContext = newContext
    }
} 