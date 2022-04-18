# Ellen Talk
- 프로젝트 기간: 2022. 02. 06 ~ 2022. 02. 12
- 프로젝트 형태: 개인 프로젝트

&nbsp;
## 프로젝트 설명
회원가입 화면의 각 필드를 확장성있는 구조로 구현하는 프로젝트

&nbsp;
## 문제점
<img width="600" alt="Screen Shot 2021-12-30 at 11 27 38 PM" src="https://i.imgur.com/3AlVEPl.png">
회원가입 화면에서 각 필드들이 세부적인 text와 각 정규표현식은 다르지만 view의 형태는 비슷하다.<br/>
예를들어 추후에 닉네임이라는 필드가 새로 추가되어야 하는 경우 AutoLayout을 처음부터 다시 적용해야한다는 불편함이있다.<br/>
또한 내국인, 외국인의 경우 사용하는 유저에 따라 입력해야하는 사항이 달라지는 경우에도 내국인과 외국인 각자 하나의 뷰를 가져야 한다는 문제가 있다.<br/>

&nbsp;
## 해결
회원가입 화면의 각 필드를 확장성 있는 구조로 구현하기 위해 protocol을 사용하여 해결했다.


```swift
enum SignUpContentsData {
    case email
    case password
    case passwordCheck
    case nickname
    
    func returnView() -> SignUpViewable { // 필요한 입력사항 구현
        switch self {
        case .email:
            return SignUpContentsView(SignUpConponent(title: "이메일", placeHolder: "ex)jcrescent61@google.com"))
        case .password:
            return SignUpContentsView(SignUpConponent(title: "비밀번호", placeHolder: "대,소,특수문자 최소 1회 포함"))
        case .passwordCheck:
            return SignUpContentsView(SignUpConponent(title: "비밀번호 확인", placeHolder: ""))
        case .nickname:
            return SignUpContentsView(SignUpConponent(title: "닉네임", placeHolder: "영어, 한글, 숫자 사용 가능"))
        }
    }
}
```

반복적인 뷰를`SignUpContentsView`로 추상화했다.<br/>
`SignUpContentsData`에 추가할 필드를 반환하는 코드를 작성했다.<br/>

&nbsp;

```swift
class SignUpViewController: UIViewController {
    private lazy var signUpView: SignUpView = SignUpView([SignUpContentsData.email.returnView(),
                                                          SignUpContentsData.nickname.returnView(),
                                                          SignUpContentsData.password.returnView(),
                                                          SignUpContentsData.passwordCheck.returnView()])
}
```

새로운 필드를 추가하고 싶은 경우나 필드의 순서를 변경해야하는 경우 signUpView가 가지고있는 배열에 새로운 필드를 추가하거나 순서를 변경해주면된다.<br/>
또한 내외국인에 따라 구성이 달라져야하는 경우에 따른 필드가 생성될 수 있게 뷰를 넘겨주면 된다.<br/>

&nbsp;
```swift
class SignUpView: UIView {
    private var signUpContentsViews: [SignUpViewable] = []
    
    init(_ views: [SignUpViewable]) {
        self.signUpContentsViews = views
        super.init(frame: .zero)
        
            signUpContentsViews.forEach {
            stackView.addArrangedSubview($0)
        }
    }
}
    
```
SignUpView가 초기화되는 시점에 `signUpContentsViews` 가 가지고 있는`[SignUpViewable]`을 `stackView`에 추가해준다.<br/>
