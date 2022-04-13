//
//  APIClient.swift
//  Marasi
//
//  Created by Amr Ghonim on 11/04/2022.
//

import Foundation
import Alamofire

class APIClient {
    
    //MARK: - getFriendList
    func getHome(onSuccess: @escaping (HomeModel) -> Void, onError: @escaping (_ error: String)-> Void) {
        let url = Constants.ProductionServer.baseURL + "task/response.json"
        AF.request(URL(string: url)!, method: .get ,encoding: JSONEncoding.default).responseData {
            response in
            switch response.result {
            case .success(let jsonData):
                do {
                    print(jsonData)
                    let data = try JSONDecoder().decode(HomeModel.self, from: jsonData)
                    if data.status?.success != false {
                        onSuccess(data)
                    } else {
                        onError(data.status?.message ?? "")
                    }
                } catch {
                    print("ParseError",error.localizedDescription)
                    onError(error.localizedDescription)
                }
                break
            case .failure(let error):
                print("Request error: \(error)")
                onError(error.localizedDescription)
                break
            }
        }
    }
    
}
