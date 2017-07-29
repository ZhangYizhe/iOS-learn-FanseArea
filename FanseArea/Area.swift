//
//  Area.swift
//  FanseArea
//
//  Created by 张艺哲 on 2017/7/18.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

struct Area {
    var name : String
    var province : String
    var part : String
    var image : String
    var isVisited : Bool
    var rating = ""
    
    init(name: String, province: String, part: String, image: String, isVisited: Bool) {
        self.name = name
        self.province = province
        self.part = part
        self.image = image
        self.isVisited = isVisited
        
    }
}


/*
Area(name: "江西省南昌市青山湖区南京东路235号", province: "江西省", part: "华南", image: "jiangxi", isVisited: false),
Area(name: "山东省济南市槐荫区经五纬七路324号", province: "山东省", part: "华南", image: "jinan", isVisited: false),
Area(name: "山东省青岛市黄岛区文化路57号", province: "山东省", part: "华东", image: "qindao", isVisited: false),
Area(name: "山东省淄博市张店区洪沟路6号", province: "山东省", part: "华东", image: "zibo", isVisited: false),
Area(name: "河南省郑州市管城回族区城东路243号宇通花园宇通花园", province: "河南省", part: "华南", image: "zhengzhou", isVisited: false),
Area(name: "湖南省长沙市人民东路职院街38号", province: "湖南省", part: "华中", image: "changsha", isVisited: false),
Area(name: "贵州省贵阳市", province: "贵州省", part: "华中", image: "guiyang", isVisited: false),
Area(name: "云南省昆明市", province: "云南省", part: "华南", image: "kunming", isVisited: false),
Area(name: "甘肃省兰州市", province: "甘肃省", part: "西北", image: "lanzhou", isVisited: false),
Area(name: "新疆乌鲁木齐市", province: "新疆", part: "西北", image: "wulumuqi", isVisited: false)
 
 */
