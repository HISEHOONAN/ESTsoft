## **📌 9.4 실습 문제**

### **실습 문제 1: 배열 평균 계산**

사용자로부터 점수를 입력받아 배열에 저장하고, 배열의 평균 점수를 출력하세요.

### **배열의 주요 메서드**

| 메서드 | 설명 | 예제 |
| --- | --- | --- |
| `append(_:)` | 배열에 요소 추가 | `numbers.append(5)` |
| `remove(at:)` | 특정 인덱스의 요소 삭제 | `numbers.remove(at: 1)` |
| `contains(_:)` | 특정 값이 배열에 있는지 확인 | `numbers.contains(3)` |
| `count` | 배열의 요소 개수 반환 | `numbers.count` |
| `sort()` | 배열을 정렬 | `numbers.sort()` |


### **실습 문제 2: 딕셔너리 검색**

사용자로부터 국가 이름을 입력받아 해당 국가의 수도를 출력하는 프로그램을 작성하세요.

### **딕셔너리의 주요 메서드**

| 메서드 | 설명 | 예제 |
| --- | --- | --- |
| `updateValue(_:forKey:)` | 키의 값을 업데이트 또는 추가 | `capitals.updateValue("Paris", forKey: "France")` |
| `removeValue(forKey:)` | 특정 키의 값을 삭제 | `capitals.removeValue(forKey: "Japan")` |
| `keys` | 딕셔너리의 모든 키 반환 | `capitals.keys` |
| `values` | 딕셔너리의 모든 값 반환 | `capitals.values` |


### **실습 문제 3: 셋 집합 연산**

두 개의 숫자 셋을 입력받아 합집합, 교집합, 차집합을 출력하는 프로그램을 작성하세요.


### **셋의 주요 메서드**

| 메서드 | 설명 | 예제 |
| --- | --- | --- |
| `insert(_:)` | 셋에 값 추가 | `uniqueNumbers.insert(5)` |
| `remove(_:)` | 특정 값을 삭제 | `uniqueNumbers.remove(3)` |
| `contains(_:)` | 특정 값이 셋에 있는지 확인 | `uniqueNumbers.contains(2)` |
| `union(_:)` | 두 셋의 합집합 반환 | `setA.union(setB)` |
| `intersection(_:)` | 두 셋의 교집합 반환 | `setA.intersection(setB)` |
| `subtracting(_:)` | 차집합 반환 | `setA.subtracting(setB)` |






<br>
<br>
<br>

### **배열 요소 관리 문제**
사용자로부터 5개의 단어를 입력받아 배열에 저장한 후,
         1. 특정 단어를 검색하여 있는지 확인하고
         2. 검색된 단어를 삭제한 뒤
         3. 배열을 출력하는 프로그램을 작성하세요.
         
         
         - readLine()을 사용하여 사용자 입력을 받습니다.
         - contains(_:)를 사용하여 배열에 특정 단어가 있는지 확인합니다.
         - remove(at:)을 사용하여 요소를 삭제합니다.
         
         출력예시
         5개의 단어를 입력하세요:
         Apple
         Banana
         Grape
         Orange
         Mango
         입력한 단어 목록: ["Apple", "Banana", "Grape", "Orange", "Mango"]
         삭제할 단어를 입력하세요:
         Grape
         'Grape'을(를) 삭제하였습니다.
         최종 단어 목록: ["Apple", "Banana", "Orange", "Mango"]

