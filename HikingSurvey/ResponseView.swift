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
        Text(response.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
    }
}

#Preview {
    ResponseView(response: Response(text: "The outdoors is my happy place, so give me a trail and some boots and I feel great!"))
}
