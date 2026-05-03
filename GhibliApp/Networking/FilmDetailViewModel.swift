//
//  FilmDetailViewModel.swift
//  GhibliApp
//
//  Created by Macbook on 3/5/26.
//


import Foundation
import Observation

@Observable
class FilmDetailViewModel {
    
    var state: LoadingState<[Person]> = .idle
    
    private let service: GhibliService
    
    init(service: GhibliService = DefaultGhibliService()) {
        self.service = service
    }
    
    func fetch(for film: Film) async {
        guard !state.isLoading else { return }
        
        state = .loading
        
        var loadedPeople: [Person] = []
    
        do {
            try await withThrowingTaskGroup(of: Person.self) { group in
                
                for personInfoURL in film.people {
                    group.addTask {
                        try await self.service.fetchPerson(from: personInfoURL)
                    }
                }
                
                // collect results as they complete
                for try await person in group {
                    loadedPeople.append(person)
                }
            }
            
            state = .loaded(loadedPeople)
            
            
        }  catch let error as APIError {
            self.state = .error(error.errorDescription ?? "unknown error")
        } catch {
            self.state = .error("unknown error")
        }
    }
}

import Playgrounds

#Playground {
    let service = MockGhibliService()
    let vm = FilmDetailViewModel(service: service)
    
    let film = service.fetchFilm()
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(film)
        let json = String(decoding: data, as: UTF8.self)
        print("json: \(json)" )
    } catch {
        print("Failed to encode film as JSON: \(error)")
        print("Fallback film: \(film)")
    }
    await vm.fetch(for: film)
    
    switch vm.state {
        case .loading: print("loading")
        case .idle: print("idle")
        case .loaded(let people):
            for person in people {
                print(person)
            }
        case .error(let error): print(error)
    }
    
}
