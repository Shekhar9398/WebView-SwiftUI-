//
//  TestWebView.swift
//  WebviewApp
//
//  Created by Omkar Zanjale on 06/01/25.
//

import SwiftUI

struct TestWebView: View {
    var body: some View {
//        SimpleWebView(url: URL(string: "https://www.apple.com")!)
//                   .edgesIgnoringSafeArea(.all)
        
        NavigationStack{
            NavigationLink(destination:  SimpleWebView(url: URL(string: "https://www.apple.com")!)
                .edgesIgnoringSafeArea(.all)){
                    
                    Text("Visit --> https://www.apple.com")
                        .foregroundColor(.mint)
                }
        }
    }
}

#Preview {
    TestWebView()
}
