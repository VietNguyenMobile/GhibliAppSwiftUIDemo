//
//  FavoriteStorage.swift
//  GhibliApp
//
//  Created by Macbook on 3/5/26.
//

import Foundation

protocol FavoriteStorage {
    func load() -> Set<String>
    func save(favoriteIDs: Set<String>)
}
