//
//  APIClient.swift
//  APITest
//
//  Created by Anil on 25/02/20.
//  Copyright © 2020 pop. All rights reserved.
//

import Foundation

typealias JSON = [String:AnyObject]

class APIClient {
    var session: URLSession!
    static var shared = APIClient()
    
    func getData(path:String, completion: @escaping (JSON?, Error?) -> Void) {
      guard let url = URL(string: path) else { fatalError() }
        
      session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
          completion(nil, error)
          return
        }
        guard let data = data else {
          completion(nil, NSError(domain: "no data", code: 10, userInfo: nil))
          return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            completion(json as? JSON, nil)
        } catch {
          completion(nil, error)
        }
      }.resume()
    }
}
