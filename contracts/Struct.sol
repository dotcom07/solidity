// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Test {
    // 구조체 정의
    struct Book { 
        string title;
        string author;
        uint book_id;
    }
    
    // Book 구조체 타입의 변수 선언
    Book book;

    // 구조체 인스턴스 설정 함수
    function setBook() public {
        book = Book('Learn Solidity', 'TP', 1);
    }

    // 구조체 멤버에 접근하여 반환하는 함수

    function getBookId() public view returns (uint) {
    return book.book_id;
    }
}