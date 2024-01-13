//
//  APIManager.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class APIManager {

    static func loadBanners(completion: @escaping ([UIImage?]) -> ()) {
            completion([UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner"),
                        UIImage(named: "pizza-banner")])
    }
}

class NetworkManager {

    static let shared = NetworkManager()

//    func fetchMeal(with id: String, completion: @escaping (Result<DetailedMealResponse, Error>) -> () ) {
//        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
//        fetchData(urlString: urlString, completion: completion)
//    }
//
//    func fetchCategoryMeals(for category: String, completion: @escaping (Result<MealResponse, Error>) -> () ) {
//        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)"
//        fetchData(urlString: urlString, completion: completion)
//    }
//
//    func fetchRandomMeal(completion: @escaping (Result<MealResponse, Error>) -> () ) {
//        let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
//        fetchData(urlString: urlString, completion: completion)
//    }

    func loadCategories(completion: @escaping (Result<CategoryResponse, Error>) -> () ) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        fetchData(urlString: urlString, completion: completion)
    }

    fileprivate func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> () ) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

            guard let data = data else { return }

            do {
                let decoded: T = try data.decoded()

                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            }
            catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

        }.resume()
    }

}

extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
