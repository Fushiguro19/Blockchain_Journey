// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
//for understanding storage, memory, calldata
//refer to : https://ethereum.stackexchange.com/questions/107028/in-what-cases-would-i-set-a-parameter-to-use-storage-instead-of-memory

contract Testing{
    struct ToDo{
        string text;
        bool completed;
    }

    ToDo[] public todos;

    function create(string calldata _text) external {
        todos.push(ToDo({text : _text, completed : false}));

    }
    /*We cannot declare storage variable inside a func. If we declare
    something as storage inside a func then that is interpreted 
    by the compiler as a storage pointer which automatically 
    points to an already declared storage variable (a location in stack which already has some value stored) outside the func.
    That is y storage is used inside a func only to update an already
    existing storage variable.*/

    function update(uint _index, string calldata _text) external {
        //updating the text at a particular index in todos array. There r 2 ways :
        //1)
        todos[_index].text = _text;

        //2)
        /*ToDo storage todo = todos[_index];
        todo.text = _text; */
        //Since todo is a storage variable of type ToDo it will point to the storage variable struct ToDo
        //This means that whatever change it will have same will be reflected in the data of ToDo outside the
        //func.

    }

    //we don't need this func since array is already public i.e. it already has its own getter func
    function get(uint _index) external view returns(string memory, bool) {
        ToDo memory todo = todos[_index];
        return(todo.text, todo.completed);
        //u can also declare todo as storage
    }

    //function to change completed status
    function updateCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
