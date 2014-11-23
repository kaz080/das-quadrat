//
//  PhotosEndPoint.swift
//  Quadrat
//
//  Created by Constantine Fry on 30/10/14.
//  Copyright (c) 2014 Constantine Fry. All rights reserved.
//

import Foundation

public enum FoursquareId {
    case CheckinId(String)
    case TipId(String)
    case VenueId(String)
    case PageId(String)
    
    func parameter() -> Parameters {
        switch self {
        case .CheckinId(let idString):
            return [Parameter.checkinId: idString]
        case .TipId(let idString):
            return [Parameter.tipId: idString]
        case .VenueId(let idString):
            return [Parameter.venueId: idString]
        case .PageId(let idString):
            return [Parameter.pageId: idString]
        }
    }
}

public class Photos : Endpoint {
    override var endpoint   : String {
        return "photos"
    }
    
    public func get(photoId: String, completionHandler: ResponseClosure? = nil) -> Task {
        return self.getWithPath(photoId, parameters: nil, completionHandler)
    }
    
    // MARK: - General
    
    public func add(fromURL: NSURL, foursquareID: FoursquareId, parameters: Parameters?, completionHandler:  ResponseClosure? = nil) -> Task {
        let path = "add"
        var allParameters = foursquareID.parameter()
        allParameters += parameters
        return self.uploadTaskFromURL(fromURL, path: path, parameters: allParameters, completionHandler)
    }

}
