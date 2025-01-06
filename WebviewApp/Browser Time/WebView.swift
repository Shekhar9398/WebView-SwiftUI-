import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var url: URL
    @Binding var loadTime: TimeInterval
    @Binding var isLoading: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if isLoading {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var startTime: Date?

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            startTime = Date()
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let startTime = startTime {
                let elapsedTime = Date().timeIntervalSince(startTime)
                parent.loadTime = elapsedTime
                parent.isLoading = false
                print("Load time: \(elapsedTime) seconds")
            }
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Failed to load: \(error.localizedDescription)")
            parent.isLoading = false
        }
    }
}
