import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HallucinationDetectorView()
                .tabItem {
                    Label("Detector", systemImage: "brain")
                }
                .tag(0)
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
} 