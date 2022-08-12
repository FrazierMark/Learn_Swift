//
//  ContentView.swift
//  H4X0R News
//
//  Created by Mark Frazier on 7/26/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }
                .navigationBarTitle("H4X0R NEWS")
        }
            .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//let posts = [
//    Post(id: "1", title: "hello"),
//    Post(id: "2", title: "bonjour"),
//    Post(id: "3", title: "hola")
//]
