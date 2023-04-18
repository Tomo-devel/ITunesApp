//
//  Star.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-13.
//

import SwiftUI

struct RatingStar: View {
    let rating: CGFloat
    let colour: Color
    let star: Int
    
    var maskRatio: CGFloat {
        let mask = rating - CGFloat(star)
        
        switch mask {
        case 1...: return 1
        case ..<0: return 0
        default: return mask
        }
    }


    init(rating: Decimal, colour: Color, star: Int) {
        self.rating = CGFloat(Double(rating.description) ?? 0)
        self.colour = colour
        self.star = star
    }


    var body: some View {
        
        GeometryReader { star in
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(colour)
                .mask(
                    Rectangle()
                        .size(
                            width: star.size.width * self.maskRatio,
                            height: star.size.height
                        )
                )
        }
    }
}
