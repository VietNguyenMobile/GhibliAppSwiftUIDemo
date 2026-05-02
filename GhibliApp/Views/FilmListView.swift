//
//  FilmListView.swift
//  GhibliApp
//
//  Created by Macbook on 2/5/26.
//


import SwiftUI

struct FilmListView: View {
    
//    var films: [Film]
    @State private var filmsViewModel = FilmsViewModel()
//    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        
        List(filmsViewModel.films) {
            Text($0.title)
        }.task {
            await filmsViewModel.fetch()
        }
        
//        List(films) { film in
//            NavigationLink(value: film) {
////               FilmRow(film: film,
////                       favoritesViewModel: favoritesViewModel)
//            }
//            
//        }
//        .navigationDestination(for: Film.self) { film in
////            FilmDetailScreen(film: film,
////                             favoritesViewModel: favoritesViewModel)
//        }
        
        
    }
}
//
//private struct FilmRow: View {
//    
//    let film: Film
//    let favoritesViewModel: FavoritesViewModel
//    
//    var body: some View {
//        HStack(alignment: .top) {
//            FilmImageView(urlPath: film.image)
//                .frame(width: 100, height: 150)
//            
//            VStack(alignment: .leading) {
//                HStack {
//                    Text(film.title)
//                        .bold()
//                    
//                    Spacer()
//                    FavoriteButton(filmID: film.id,
//                                   favoritesViewModel: favoritesViewModel)
//                    .buttonStyle(.plain)
//                    .controlSize(.large)
//                }
//                .padding(.bottom, 5)
//                
//                Text("Directed by \(film.director)")
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                
//                Text("Released: \(film.releaseYear)")
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//            }
//            .padding(.top)
//        }
//    }
//}
//
//
//
//#Preview {
//
//    //@State @Previewable var filmsViewModel = FilmsViewModel(service: MockGhibliService())
//    @State @Previewable var favorites = FavoritesViewModel(service: MockFavoriteStorage())
//    
//    NavigationStack {
//        FilmListView(films: [Film.example, Film.exampleFavorite],
//                     fa    FilmListView()ViewModel: favorites)
//    }
//    .task {
//        favorites.load()
//    }
//}
//
//

#Preview {
    FilmListView()
}
