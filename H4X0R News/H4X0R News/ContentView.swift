//
//  ContentView.swift
//  H4X0R News
//
//  Created by Mark Frazier on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        List(posts) { post in
            Text(post.title).padding()
        }
        .navigationBarTitle("H4X0R NEWS")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let posts = [
    Post(id: "1", title: "hello"),
    Post(id: "2", title: "bonjour"),
    Post(id: "3", title: "hola")
]
