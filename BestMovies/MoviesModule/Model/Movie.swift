//
//  Movie.swift
//  BestMovies
//
//  Created by Denis on 29.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

struct Movie: Decodable {
    let Title: String?
    let Year: String?
    let Rated: String?
    let Released: String?
    let Runtime: String?
    let Genre: String?
    let Director: String?
    let Writer: String?
    let Actors: String?
    let Plot: String?
    let Language: String?
    let Country: String?
    let Awards: String?
    let Poster: String?
    let Metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let `Type`: String?
    let Response: String?
    let Images: [String]?
    
    var fullDescription: String {
        return """
        Название: \(Title ?? "")
        Год выхода: \(Year ?? "")
        Рейтинг: \(Rated ?? "")
        Дата выхода: \(Released ?? "")
        Дата выхода: \(Released ?? "")
        Длительность: \(Runtime ?? "")
        Жанр: \(Genre ?? "")
        Директор: \(Director ?? "")
        Писатель: \(Writer ?? "")
        Актёры: \(Actors ?? "")
        Сюжет: \(Plot ?? "")
        Язык: \(Language ?? "")
        Страна: \(Country ?? "")
        Награды: \(Awards ?? "")
        Оценка: \(Metascore ?? "")
        IMDB рейтинг: \(imdbRating ?? "")
        IMDB голосов: \(imdbVotes ?? "")
        IMDB ID: \(imdbID ?? "")
        Вид: \(`Type` ?? "")
        """
    }

}
