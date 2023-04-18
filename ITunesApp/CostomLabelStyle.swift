//
//  CostomLabelStyle.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-10.
//

import SwiftUI

struct ImageAndTextChange: LabelStyle {
    let value: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            
            if !value.isEmpty {
                configuration.icon
            }
        }
    }
}
