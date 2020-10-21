//
//  File.swift
//  
//
//  Created by Murilo Araujo on 20/10/20.
//

import Foundation

class FileService {
    
    let fManager = FileManager.default
    
    /// Get file url from file in current directory using file name
    /// - Parameter fileName: Name of the file
    /// - Throws: Error
    /// - Returns: File url
    func getFileURL(for fileName: String) throws -> URL {
        let path = fManager.currentDirectoryPath+"/\(fileName)"
        if fManager.fileExists(atPath: path) {
            return URL(fileURLWithPath: path)
        } else {
            throw MAError(title: "Erro", description: "O arquivo fornecido não existe no diretório atual", code: 0)
        }
    }
}
