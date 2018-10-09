//
//  MovieEndPoint.swift
//  NetworkLayer
//
//

import Foundation

enum NetworkEnvironment {
    case production
}

public enum NewYorkTimes: Int{
    case topStories
}

public enum NewYorkTimesApi {
    case getTopStories(section: String, apiKey: String)
}

extension NewYorkTimesApi: EndPointType {
    /** API base urls. */
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "http://api.nytimes.com/svc/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    /** API path for specific request. */
    var path: String {
        switch self {
        case .getTopStories(let section):
            return "topstories/v2/\(section).json"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    /** generate task based on requested Picture's API. */
    var task: HTTPTask {
        switch self {
        case .getTopStories(_, let apiKey):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api-key": apiKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}



