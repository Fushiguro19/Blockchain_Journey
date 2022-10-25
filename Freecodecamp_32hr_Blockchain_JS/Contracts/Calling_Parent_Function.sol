// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Calling Parent function : 2 ways : direct and super

contract E{
    event Log(string message);
    function foo() public virtual {
        emit Log("emit E.foo");
    }

    function bar() public virtual {
        emit Log("emit E.bar");
    }
}

contract F is E{
    function foo() public virtual override {
        emit Log("emit F.foo");
        E.foo(); //one way to call a parent function
    } //event of parent contract can be called from child contract only when it is wrapped inside a func like u can see we did here ....

    function bar() public virtual override {
        emit Log("emit F.bar");
        super.bar(); //another way to call a parent function
    }
}

contract G is E{
    function foo() public virtual override {
        emit Log("emit G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("emit G.bar");
        super.bar(); 
    }
}

contract H is F,G{
    function foo() public override(F,G){
        F.foo();
    }

    function bar() public override(F,G){
        super.bar();
    }
    /* If we do not override the bar func here then compiler will throw error coz the bar func is 
    declared in both the base functions of this contract, hence it is mandatory to declare it here as well.
    But, in case we don't want to , we can declare this func as abstract*/
    //F.foo(), which is the direct method, will only call function from contract F which in turn calls event from contract E
    //super.bar() method will call the bar() function from all the parent contracts i.e. F, G and E.
}
