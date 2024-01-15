//
//  APIManager.swift
//  HammerSystemsTestProject
//
//  Created by Dmitriy Voronin on 12.01.2024.
//

import UIKit

class APIManager {

    static func loadBanners(completion: @escaping ([Banner]) -> ()) {
            completion([
                Banner(image: "pizza-banner"),
                Banner(image: "star"),
                Banner(image: "pizza-banner"),
                Banner(image: "star"),
            ])
    }
}

class NetworkManager {

    static let shared = NetworkManager()

//    func fetchMeal(with id: String, completion: @escaping (Result<DetailedMealResponse, Error>) -> () ) {
//        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
//        fetchData(urlString: urlString, completion: completion)
//    }
//
    func loadCategoryMeals(for category: String, completion: @escaping (Result<MealsResponse, Error>) -> () ) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        fetchData(urlString: urlString, completion: completion)
    }
//
//    func fetchRandomMeal(completion: @escaping (Result<MealResponse, Error>) -> () ) {
//        let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
//        fetchData(urlString: urlString, completion: completion)
//    }

    func loadCategories(completion: @escaping (Result<CategoriesResponse, Error>) -> () ) {
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

class ImageDownloader {
    static func downloadImage(_ urlString: String, completion: ((_ image: UIImage?, _ urlString: String?) -> ())?) {
       guard let url = URL(string: urlString) else {
          completion?(nil, urlString)
          return
      }
      URLSession.shared.dataTask(with: url) { (data, response,error) in
         if let error = error {
            print("error in downloading image: \(error)")
            completion?(nil, urlString)
            return
         }
         guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
            completion?(nil, urlString)
            return
         }
         if let data = data, let image = UIImage(data: data) {
            completion?(image, urlString)
            return
         }
         completion?(nil, urlString)
      }.resume()
   }
}
