//
//  Movies.swift
//  Streaming_Service_MVVM
//
//  Created by Daniil Yarkovenko on 15.08.2022.
//

import Foundation

struct TrendingTitleResponse: Decodable {
    let results: [Title]
}

struct Title: Decodable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}


/*
 {
adult = 0;
"backdrop_path" = "/qpH6z1e4Lm9O4vWClSfDzSxPnqd.jpg";
"genre_ids" =             (
 28,
 14,
 27
);
id = 755566;
"media_type" = movie;
"original_language" = en;
"original_title" = "Day Shift";
overview = "An LA vampire hunter has a week to come up with the cash to pay for his kid's tuition and braces. Trying to make a living these days just might kill him.";
popularity = "348.59";
"poster_path" = "/bI7lGR5HuYlENlp11brKUAaPHuO.jpg";
"release_date" = "2022-08-10";
title = "Day Shift";
video = 0;
"vote_average" = "6.821";
"vote_count" = 198;
},
 {
adult = 0;
"backdrop_path" = "/7ZO9yoEU2fAHKhmJWfAc2QIPWJg.jpg";
"genre_ids" =             (
 28,
 878,
 27
);
id = 766507;
"media_type" = movie;
"original_language" = en;
"original_title" = Prey;
overview = "When danger threatens her camp, the fierce and highly skilled Comanche warrior Naru sets out to protect her people. But the prey she stalks turns out to be a highly evolved alien predator with a technically advanced arsenal.";
popularity = "16755.428";
"poster_path" = "/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg";
"release_date" = "2022-08-02";
title = Prey;
video = 0;
"vote_average" = "8.148999999999999";
"vote_count" = 2320;
},
 */

