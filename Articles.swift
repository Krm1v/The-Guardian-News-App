//
//  Results.swift
//  The Guardian News App
//
//  Created by Владислав Баранкевич on 02.12.2021.
//

struct NewsFeed: Codable {
    let status: String?
    let articles: [Articles]
}

struct Articles: Codable {
    let author: String?
    let title: String?
    let url: String?
    let source: Source
}

struct Source: Codable {
    let id: String?
    let name: String?
}

