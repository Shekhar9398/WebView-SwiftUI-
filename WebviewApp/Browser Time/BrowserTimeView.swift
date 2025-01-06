import SwiftUI
import WebKit

struct BrowserTimeView: View {
    @State private var currentURL = URL(string: "https://www.apple.com")!
    @State private var loadTime: TimeInterval = 0.0
    @State private var isLoading = true
    @State private var timer: Timer? = nil

    var body: some View {
        VStack {
            WebView(
                url: $currentURL,
                loadTime: $loadTime,
                isLoading: $isLoading
            )
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // Start the timer to reload the URL every 10 seconds
                startTimer()
            }
            .onDisappear {
                // Invalidate the timer when the view disappears
                timer?.invalidate()
            }

            Text("Load time: \(loadTime, specifier: "%.2f") seconds")
                .padding()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            reloadURL()
        }
    }

    private func reloadURL() {
        isLoading = true
        currentURL = URL(string: "https://www.apple.com")!
    }
}

#Preview {
    BrowserTimeView()
}
