//: Playground - noun: a place where people can play

import UIKit


var areas = ["江西省南昌市","山东省济南市","山东省青岛市","山东省淄博市","河南省郑州市","湖南省长沙市","贵州省贵阳市","云南省昆明市","甘肃省兰州市","新疆乌鲁木齐市"]

var province = ["江西省","山东省","山东省","山东省","河南省","湖南省","贵州省","云南省","甘肃省","新疆"]

var part = ["华南","华南","华东","华东","华南","华中","华中","华南","西北","西北"]

var areasImages = ["jiangxi","jinan","qindao","zibo","zhengzhou","changsha","guiyang","kunming","lanzhou","wulumuqi"]
var visited = [Bool](repeatElement(false, count: 11))

for i in 0..<areas.count {
    print("Area(name: \"\(areas[i])\", province: \"\(province[i])\", part: \"\(part[i])\", image: \"\(areasImages[i])\", isVisited: \(visited[i])),")
    
    
}