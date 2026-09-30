//
//  ContentView.swift
//  HikingSurvey
//
//  Created by chuonpiseth on 30/9/26.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var textFieldIsFocused: Bool
    @State var responses: [Response] = []
    @State private var reponseText = ""
    var scorer = Scorer()
    
    func saveResponse(text: String) {
        let score = scorer.score(text)
        let response = Response(text: text, score: score)
        responses.insert(response, at: 0)
    }
    
    var body: some View {
        VStack {
            Text("Options on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 24)
            
            ScrollView {
                ChartView(responses: responses)
                
                ForEach(responses) { response in
                    ResponseView(response: response)
                }
            }
            HStack {
                TextField("What do you thing about hiking?", text: $reponseText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                Button("Done") {
                    guard !reponseText.isEmpty else { return }
                    saveResponse(text: reponseText)
                    reponseText = ""
                    textFieldIsFocused = false
                }
                .padding(.horizontal, 4)
            }
            .padding(.bottom, 8)
        }
        .onAppear {
            for response in Response.sampleResponse {
                saveResponse(text: response)
            }
        }
        .padding(.horizontal)
        .background(Color(white: 0.94))
    }
}

#Preview {
    ContentView()
}
