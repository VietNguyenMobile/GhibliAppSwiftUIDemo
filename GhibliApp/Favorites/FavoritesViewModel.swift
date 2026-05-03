//
//  FavoritesViewModel.swift
//  GhibliApp
//
//  Created by Macbook on 3/5/26.
//

import Foundation
import Observation

@Observable
class FavoritesViewModel {
    private(set) var favoriteIDs: Set<String> = []
    
    private let service: FavoriteStorage
    
    init( service: FavoriteStorage = DefaultFavoriteStorage()) {
            self.service = service
        }
    
    
    //MARK: - preview
    static var example: FavoritesViewModel {
        let vm = FavoritesViewModel(service: MockFavoriteStorage())
        vm.favoriteIDs = ["2baf70d1-42bb-4437-b551-e5fed5a87abe"]
        
        return vm
    }
}
