//
//  NetworkManager.swift
//  NetworkLayer
//
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case noResponseObject = "No responseObject returned."
}

enum Result<String>{
    case success
    case failure(String)
}

class NetworkManager {
    static var environment : NetworkEnvironment = .production
    let router = Router<NewYorkTimesApi>()
    
    /**
     Fetched Top Stories data based on New York Times Top Story API and Section
     - Parameter section: specific section for requested topStories.
     - Parameter apiKey: API key to request topStories.
     - Parameter completion: block to handle the fetch results
     */
    func getTopStories(section: String, apiKey: String, completion: @escaping (_ stories: [Story]?,_ error: String?)->()) {
        router.request(.getTopStories(section: section, apiKey: apiKey)) { data, response, error in
            let result = self.handleNetworkResponse(data: data, response: response, error: error)
            switch result{
            case .success:
                do {
                    /*let jsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print(jsonData)*/
                    let apiResponse = try JSONDecoder().decode(TopStoriesAPIResponse.self, from: data!)
                    completion(apiResponse.stories, nil)
                }catch {
                    print(error)
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    /**
     Handle all basic network error responses
     */
    fileprivate func handleNetworkResponse(data: Data?, response: URLResponse?, error: Error?) -> Result<String>{
        if error != nil {
            return .failure("Please check your network connection.")
        }
        
        if let response = response as? HTTPURLResponse {
            switch response.statusCode {
            case 200...299:
                print("HTTPURLResponse: success")
            case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
            case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
            case 600: return .failure(NetworkResponse.outdated.rawValue)
            default: return .failure(NetworkResponse.failed.rawValue)
            }
        }
        
        guard data != nil else {
            return .failure(NetworkResponse.noData.rawValue)
        }
        
        return .success
    }
}
