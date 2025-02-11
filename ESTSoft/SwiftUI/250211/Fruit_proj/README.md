# 2-2 실전 앱 구현하기

## **사전 준비**

### **프로젝트 내려받기**

- `git clone` 명령어로 샘플 프로젝트 다운로드.
- **소스 컨트롤 네비게이션**을 사용해 프로젝트 상태 확인.
- **초기 설정**에서 **체크아웃(Checkout)** 하여 프로젝트 준비.

```bash
git clone https://github.com/beomjoon8253/ShopSwiftUI.git
```

---

## **프로젝트 구성 살펴보기**

### **앱의 주요 기능**

과일마트 앱은 **4개의 탭(Tab)**으로 구성되어 있습니다.

1. **홈 (Home)**
    - 인기 상품 및 추천 상품 표시
2. **레시피 (Recipe)**
    - 과일을 활용한 요리법 제공
3. **갤러리 (Gallery)**
    - 사용자 사진 갤러리
4. **마이페이지 (My Page)**
    - 사용자 정보 관리

---

### **초기 프로젝트 구성**

### **프로젝트 파일 구조**

- **Source**: Swift 파일들이 그룹으로 정리되어 있습니다.
- **Assets**: 앱에 사용되는 이미지, 컬러 리소스
- **ProductData.json**: JSON 파일에 상품 데이터를 저장합니다.
- **Launch Screen**: 앱이 실행될 때 표시되는 초기 화면 구성

---

## **기본 뷰 구성하기**

### **Home.swift 소스 코드**

`Home` 화면은 **상품 정보를 카드 형태로 표시**합니다.

### **예제 코드**

```swift
import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<5) { _ in
                    ProductCard()
                        .padding()
                }
            }
        }
        .navigationTitle("과일마트")
    }
}
```

---

### **상품 정보 화면 구성**

**`ProductCard`** 뷰는 각 상품의 정보를 카드 형태로 보여줍니다.

```swift
struct ProductCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("apple")
                .resizable()
                .frame(height: 150)
                .clipped()  // 이미지 잘라내기
            Text("신선한 사과")
                .font(.headline)
            Text("₩1,000")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
```

---

## **뷰 추출하기**

### **ProductRow 추출**

**ProductRow** 뷰를 **별도의 파일**로 분리해 재사용성을 높입니다.

1. **ProductRow.swift** 파일을 생성합니다.
2. `ProductCard` 뷰 코드를 **ProductRow**로 옮기고 수정합니다.

```swift
struct ProductRow: View {
    var productName: String
    var price: String
    var imageName: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipped()
            VStack(alignment: .leading) {
                Text(productName)
                    .font(.headline)
                Text(price)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }
}
```

---

## **컬러 익스텐션 활용하기**

**HEX 코드**로 컬러를 생성하기 위해 **`ColorExtension`** 파일을 추가합니다.

### **ColorExtension.swift**

```swift
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
```

### **사용 예제**

```swift
Text("Hello, SwiftUI!")
    .padding()
    .background(Color(hex: "#FF5733"))  // HEX 코드로 배경 설정
    .cornerRadius(10)
```

---

## **Product 모델 적용하기**

### **Product 모델 생성**

`Product` 모델을 생성하고, 상품 정보를 저장합니다.

```swift
struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var imageName: String
}
```

---

### **Product 모델 활용**

`Product` 데이터를 사용해 `ProductRow` 뷰에 상품 정보를 전달합니다.

```swift
struct ProductListView: View {
    let products = [
        Product(name: "신선한 사과", price: 1000, imageName: "apple"),
        Product(name: "달콤한 바나나", price: 1500, imageName: "banana"),
        Product(name: "상큼한 오렌지", price: 2000, imageName: "orange")
    ]

    var body: some View {
        List(products) { product in
            ProductRow(productName: product.name, price: "₩\(product.price)", imageName: product.imageName)
        }
        .navigationTitle("상품 목록")
    }
}
```

---

## **정리**

SwiftUI에서 **모델과 뷰를 분리**하고, **뷰 재사용성을 높이는 패턴**을 학습했습니다.

- `ProductRow`로 뷰를 추출하여 **UI를 모듈화**할 수 있습니다.
- **HEX 코드 기반 컬러 익스텐션**을 사용해 더 다양한 색상 지원이 가능합니다.
- **Product 모델**을 생성해 데이터와 UI를 분리하고 **유지보수성을 향상**할 수 있습니다.
