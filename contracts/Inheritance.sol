// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Inheritance 트리는 1번 사진 참고

contract A {
    // 이것은 event로 함수에서 이벤트를 발생시키고 transaction log에 기록된다.
    // 이는 함수 호출을 tracing하는데 유용하다.
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
    // Try:
    // - D.foo를 호출하고 transaction logs를 확인
    //   D가 A, B, C를 상속했지만 C와 A만 호출한다.
    // - D.bar를 호출하고 transaction logs를 확인
    //   D 는 C를 호출하고, 그 다음엔 B를 호출하고, 마지막으로는 A를 호출한다.
    //   super이 B와 C에 의해서 두번 호출되었지만 A는 한번만 호출된다.

    function foo() public override(B, C) {
        super.foo();
    }

    function bar() public override(B, C) {
        super.bar();
    }
}
