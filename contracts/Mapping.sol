// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Mapping {
    // 각 주소에 uint 값을 저장하는 mapping을 선언
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        // 매개변수로 입력 받은 주소에 저장된 uint 값을 불러오는 함수이다.
        // 만약 값이 저장되어 있지 않다면, 기본 값이 reutrn 된다.
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        // 매개변수의 첫번째 인자로 입력받은 주소에 두번째 인자로 입력받은 값 _i를 저장한다.
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // 매개변수로 입력받은 주소에 저장된 값을 삭제시키고 기본 값으로 초기화한다.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // 중첩 mapping (주소에 또 다른 mapping을 저장, 즉, mapping안에 mapping을 넣는 방식이다.)
    // 이 mappinp은 주소와 uint로 bool 값을 저장할 수 있다.
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1, uint256 _i) public view returns (bool) {
        // 겉의 mapping의 키(주소)를 입력받고, 안의 mapping의 키(_i)를 입력받아 값을 불러올 수 있다.
        // 초기화 되지 않은 경우에도 가능하다.
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint256 _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}
