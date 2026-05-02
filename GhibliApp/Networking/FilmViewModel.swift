//
//  FilmViewModel.swift
//  GhibliApp
//
//  Created by Macbook on 2/5/26.
//


import Foundation
import Observation

@Observable
class FilmsViewModel {
    
    var films: [Film] = []

//    var state: LoadingState<[Film]> = .idle
//    
//    private let service: GhibliService
//    
//    init(service: GhibliService = DefaultGhibliService()) {
//        self.service = service
//    }
//    
    func fetch() async {
        
        let url = URL(string: "https://ghibliapi.vercel.app/films")!
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            films = try JSONDecoder().decode([Film].self, from: data)
        } catch {
            print(error)
        }
        
//        guard !state.isLoading || state.error != nil else { return }
//        
//        state = .loading
//        
//        do {
//            let films = try await service.fetchFilms()
//            self.state = .loaded(films)
//        } catch let error as APIError {
//            self.state = .error(error.errorDescription ?? "unknown error")
//        } catch {
//            self.state = .error("unknown error")
//        }
    }
//    
//    
//// MARK: - Preview
//    
//    static var example: FilmsViewModel {
//        let vm = FilmsViewModel(service: MockGhibliService())
//        vm.state = .loaded([Film.example, Film.exampleFavorite])
//        return vm
//    }

}
