//
//  WebView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-03.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String
    
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        print("url: \(url)")
        guard let url = URL(string: url) else {
            return
        }

        uiView.configuration.mediaTypesRequiringUserActionForPlayback = []
        uiView.load(URLRequest(url: url))
    }
}
