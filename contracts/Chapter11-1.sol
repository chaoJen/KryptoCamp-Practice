// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

contract B {

    // 函式、modifier 或狀態被宣告 virtual 時表示在子合約中能夠被覆寫
    function foo() virtual external returns (string memory) {
        return "B.foo()";
    }

    function foo(uint _data) external {

    }
}

contract A is B {
    
    // 當一個子合約中函式、、modifier 或狀態被宣告 override 時表示他覆寫了父合約的程式
    function foo() external override pure returns (string memory) {
        return "A.foo()";
    }
}

contract C {

    function callFoo(address _addrB) external {
        string memory result = B(_addrB).foo();
    }

    function createA() external {
        A contractA = new A();
        contractA.foo();
    }
}

/**
 * Polymorphism
 *
 * - FunctionPolymorphism
 * - ContractPolymorphism
 */

contract Base1 {
    
    function foo() virtual public {

    }
}

contract Base2 {
    
    function foo() virtual public {

    }
}

// 可以同時可以同時 override 兩個父合約的函示的函示
contract Inherited is Base1, Base2 {

    function foo() public override (Base1, Base2) {
        
    }
}

// 多重繼承與 super
contract D {
    
    uint public u;

    function f() public virtual {
        u = 1;
    }
}

contract E is D {

    function f() public virtual override {
        u = 2;
    }
}

contract F is E {

    function f() public override { // u: 3
        u = 3;
    }

    function f1() public { // u: 2
        super.f();
    }

    function f2() public { // u: 2
        E.f();
    }

    function f3() public { // u: 1
        D.f();
    }
}