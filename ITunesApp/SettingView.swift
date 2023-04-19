//
//  SettingView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-30.
//

import SwiftUI

struct SettingView: View {
    @Binding var isShowSettingView: Bool
    
    var body: some View {
        
        VStack {
            List {
                Section {
                    NavigationLink {
                        // TODO: 履歴を表示するViewに遷移
                        EmptyView()
                        
                    } label: {
                        Text("履歴")
                    }
                    
                } header: {
                    Text("履歴")
                }
            }
        }
        .toolbar {
            Button {
                isShowSettingView.toggle()
                
            } label: {
                Text("完了")
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isShowSettingView: .constant(false))
    }
}
