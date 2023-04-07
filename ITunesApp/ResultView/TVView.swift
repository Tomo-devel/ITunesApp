//
//  TVView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-01.
//

import SwiftUI

struct TVView: View {
    @ObservedObject var viewModel: SearchViewModel
    let screenWidth: Double
    let columns: [GridItem]

    init(viewModel: SearchViewModel,
         screenWidth: Double) {
        self.viewModel = viewModel
        self.screenWidth = screenWidth
        self.columns = [GridItem(.fixed(screenWidth / 2)),
                        GridItem(.fixed(screenWidth / 2))]
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.tvShowResults!, id: \.self) { result in
                    Button {
                        // TODO: 詳細を表示するVIEWに遷移させる処理
                        
                    } label: {
                        HStack {
                            URLImage(url: result.artworkUrl100,
                                     radius: 0.0)

                            VStack(alignment: .leading) {
                                Text("（\(result.primaryGenreName)）")
                                
                                Text(result.trackName)
                                    .padding(.bottom)
                                
                                Text(result.artistName)
                            }
                            .frame(width: screenWidth / 3, alignment: .leading)

                            Spacer()
                        }
                        .padding()
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding()
    }
}

struct TVView_Previews: PreviewProvider {
    static var previews: some View {
        TVView(viewModel: SearchViewModel(),
               screenWidth: 0.0)
    }
}
