//
//  main.swift
//  Kiosk
//
//  Created by 유창선 on 12/5/23.
//
class Menu {
    var items: [(name: String, price: Double, description: String)] = []

    func getInput() -> String? {
        return readLine()
    }

    func showMenu() {
        for (index, item) in items.enumerated() {
            print("\(index + 1). \(item.name)   | W \(item.price) | \(item.description)")
        }
        print("9. 뒤로가기")
    }

    func processInput(_ input: String) {
        
    }
}

class BurgerMenu: Menu {
    override init() {
        super.init()
        self.items = [("ShackBurger", 6.9, "토마토, 양상추, 쉑소스가 토핑된 치즈버거"),
                      ("SmokeShack", 8.9, "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
                      ("Shroom Burger", 9.4, "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거"),
                      ("Cheeseburger", 6.9, "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
                      ("Hamburger", 5.4, "비프패티를 기반으로 야채가 들어간 기본버거")]
    }
}

class FrozenMenu: Menu {
    override init() {
        super.init()
        self.items = [("Chocolate Frozen Custard", 5.5, "초콜릿맛 Chocolate Frozen Custard"),
                      ("Vanila Frozen Custard", 5.5, "바닐라맛 Chocolate Frozen Custard")]
    }
}

class DrinksMenu: Menu {
    override init() {
        super.init()
        self.items = [("Cola", 2.5, "코카콜라"),
                      ("Cider", 2.5, "사이다")]
    }
}

class BeersMenu: Menu {
    override init() {
        super.init()
        self.items = [("Lager", 4.5, "브루클린라거"),
                      ("BrownAle", 4.5, "상큼한 브라운 에일")]
    }
}

class ShakeShackMenu {
    private var menus: [Menu] = []

    init() {
        menus.append(BurgerMenu())
        menus.append(FrozenMenu())
        menus.append(DrinksMenu())
        menus.append(BeersMenu())
    }

    func showMenu() {
        print("////아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.////")
        print("1. Burger|앵거스 비프 통살을 다져만든 버거")
        print("2. Frozen Custard|매장에서 신선하게 만드는 아이스크림")
        print("3. Drinks|매장에서 직접 만드는 음료")
        print("4. Beer|뉴욕 브루클린 브루어리에서 양조한 맥주")
        print("0.종료|프로그램 종료")
    }

    func processInput(_ input: String) {
        switch input {
        case "1":
            menus[0].showMenu()
        case "2":
            menus[1].showMenu()
        case "3":
            menus[2].showMenu()
        case "4":
            menus[3].showMenu()
        case "0":
            print("프로그램 종료")
        case "9":
            showMenu()
        default:
            print("잘못된 입력입니다.")
        }

        if let newInput = readLine() {
            processInput(newInput)
        }
    }
}

let menuinteraction = ShakeShackMenu()
menuinteraction.showMenu()

if let input = readLine() {
    menuinteraction.processInput(input)
}
