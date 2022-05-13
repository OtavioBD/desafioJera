//
//  MovieDB+CoreDataProperties.swift
//  loginScreen
//
//  Created by Otavio Benatti Dias on 11/05/22.
//
//

import Foundation
import CoreData


extension MovieDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieDB> {
        return NSFetchRequest<MovieDB>(entityName: "MovieDB")
    }

    @NSManaged public var title: String?
    @NSManaged public var overview: String?
    @NSManaged public var voteAverage: Double

}

extension MovieDB : Identifiable {

}
