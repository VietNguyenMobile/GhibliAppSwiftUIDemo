//
//  GhibliService.swift
//  GhibliApp
//
//  Created by Macbook on 3/5/26.
//

import Foundation


protocol GhibliService: Sendable {
    func fetchFilms() async throws -> [Film]
    func fetchPerson(from URLString: String) async throws -> Person
    func searchFilm(for searchTerm: String) async throws -> [Film]
}
