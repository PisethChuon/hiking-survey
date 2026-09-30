//
//  ResponseView.swift
//  HikingSurvey
//
//  Created by chuonpiseth on 30/9/26.
//

import SwiftUI

struct ResponseView: View {
    var response: Response
    
    var body: some View {
        HStack {
            Text(response.text)
                .padding(.trailing)
            
            Spacer()
            Image(systemName: response.sentiment.icon)
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(response.sentiment.sentimentColor)
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 8).fill(.white))

    }
}

#Preview {
    ResponseView(response: Response(text: "The outdoors is my happy place, so give me a trail and some boots and I feel great!", score: 1.0))
}
