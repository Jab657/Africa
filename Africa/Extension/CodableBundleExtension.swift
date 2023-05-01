//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Jacob Colombo on 5/1/23.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {
        //Step 1. Locate JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle")
        }
                
        //Step 2. Create a propety for the date
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle")
        }
                
        //Step 3. Create a Decoder
                let decoder = JSONDecoder()
                
        //Step 4. Create a propety for the decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode \(file) from the bundle")
        }
                
        //Step 5. Return the ready-to-use data
                return loaded
                
    }
}
