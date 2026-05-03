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
        NavigationStack {
            switch filmsViewModel.state {
                case .idle:
                    Text("No Films yet")
                    
            case .loading:
                ProgressView {
                    Text("Loading Films...")
                }
                case .loaded(let films):
//                List(films) {
//                    Text($0.title)
//                }
                List(films) { film in
                    NavigationLink(value: film) {
//                        Text(film.title)
                        FilmRow(film: film)
                    }
                }
                .navigationDestination(for: Film.self) { film in
                        FilmDetailScreen(film: film)
                }
                    
                case .error(let error):
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                    
                }
        }.task {
            await filmsViewModel.fetch()
        }
        
        
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

private struct FilmRow: View {
    
    let film: Film
//    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            FilmImageView(urlPath: film.image)
                .frame(width: 100, height: 150)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(film.title)
                        .bold()
                    
                    Spacer()
//                    FavoriteButton(filmID: film.id,
//                                   favoritesViewModel: favoritesViewModel)
                    .buttonStyle(.plain)
                    .controlSize(.large)
                }
                .padding(.bottom, 5)
                
                Text("Directed by \(film.director)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Released: \(film.releaseYear)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.top)
        }
    }
}


//
//#Preview {
//
//    @State @Previewable var vm = FilmsViewModel(service: MockGhibliService())
//    
//    FilmListView(filmsViewModel: vm)
//        
    
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



#Preview {
    FilmListView()
}
