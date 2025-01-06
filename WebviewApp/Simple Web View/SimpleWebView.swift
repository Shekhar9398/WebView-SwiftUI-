//
//  SimpleWebView.swift
//  WebviewApp
//
//  Created by Omkar Zanjale on 06/01/25.
//

import SwiftUI
import WebKit

struct SimpleWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url)
        uiView.load(req)
    }

}
