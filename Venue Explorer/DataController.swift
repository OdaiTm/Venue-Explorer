//
//  DataController.swift
//  BookwormApp
//
//  Created by Odai Tmrawe on 11/11/2026.
//

import Foundation
import CoreData
import Combine


class DataController: ObservableObject {


    let container = NSPersistentContainer(name: "Bookworm")

    init() {
        container.loadPersistentStores { description, error in

            if let error = error {
                print("Core Data error: \(error.localizedDescription)")
            }
        }
    }
}
