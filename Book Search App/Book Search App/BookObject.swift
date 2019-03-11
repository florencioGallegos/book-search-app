//
//  BookObject.swift
//  Book Search App
//
//  Created by MAC Consultant on 3/10/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

    import UIKit
    
    class bookObjects: Codable {
        let items: [bookObject]
        
        init(items: [bookObject]) {
            self.items = items
        }
    }
    
    class imageLinks: Codable
    {
        let smallThumbnail: String
        let thumbnail: String
        
        init(smallThumbnail: String, thumbnail: String)
        {
            self.smallThumbnail = smallThumbnail
            self.thumbnail = thumbnail
        }
    }

class volumeInfo: Codable
{
    let title: String
    let authors: [String]
    let description: String
    let imageLinks: imageLinks
    
    init(title: String, authors: [String], description: String, imageLinks: imageLinks)
    {
        self.title = title
        self.authors = authors
        self.description = description
        self.imageLinks = imageLinks
    }
}
    class bookObject: Codable
    {
        let volumeInfo: volumeInfo
        
        init(volumeInfo: volumeInfo)
        {
            self.volumeInfo = volumeInfo
        }
    }

