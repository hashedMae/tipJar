// SPDX-License-Identifier: MIT
pragama solidity ^0.8.0;

/**
* @dev Contract for collecting tips and then splitting them among the employees at the end of shift
* contains no auth control, we run on the honor system in this coffeeshop
*/

contract tipJar {

/**
* constructor initializes array of addresses called _employees
* this will be used to pay out tips for who's on shift
*/
  constructor() {
    address[] _employees;
  }

  function tip() public payable {
    require(msg.value > 0);
  }

  function addToPool(address _employeeAddress) public {
    _employees.push(_employeeAddress);
  }

  function _splitItUp() internal memory returns(uint){
    uint _onShift = _employees.length();
    return _onShift;
  }

  function payOut() public {
    uint share = balanceOf(this) % _splitItUp();
    i = 0
    for(i < _employees.length()) {
      transfer(_employees[i], share);
      i++;
    }
    for(i < _employees.length()) {
      _employees.shift();
    }
  }

}
