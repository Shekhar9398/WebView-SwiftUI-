//
//  ListView.swift
//  WebviewApp
//
//  Created by Omkar Zanjale on 06/01/25.
//

import SwiftUI

struct ListView: View {
        
    var body: some View {
        NavigationStack {
            let columns = [
                   GridItem(.fixed(50)), // First row with fixed height
               ]
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: columns, content: {
                    ForEach(50...100, id: \.self){val in
                        Image(systemName: "person")
                    }
                })
                .frame(height: 100)
            }
            
            List{
                ForEach(0...10, id: \.self){row in
                    NavigationLink(destination: DetailView(name: "\(row)")){
                        HStack(spacing: 20) {
                            Image(systemName: "\(row).circle.fill")
                                .imageScale(.large)
                            
                            Text("Row number \(row)")
                        }
                    }
                }
                .foregroundColor(.gray)
                .bold()
                .padding()
            }
            .listStyle(.plain)
            .navigationTitle("My List")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    ListView()
}
