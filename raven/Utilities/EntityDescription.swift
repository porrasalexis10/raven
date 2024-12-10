//
//  EntityDescription.swift
//  raven
//
//  Created by ALEXIS ANTONIO PORRAS LOBATO on 09/12/24.
//
public protocol EntityDescription {
    static var name: String { get }
}
public extension EntityDescription {
    static var name: String {
        return String(describing: self)
    }
}
