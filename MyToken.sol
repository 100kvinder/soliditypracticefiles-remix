// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Mytoken {
    string public name ;
    string public symbol;
    uint public totalSupply;
    mapping (address => uint) public balanceOf ;


    //staking variables
    mapping (address =>uint) public stakingBalance;
    mapping (address => bool) public isStaking;
    uint public tokenStaked;

    constructor (string memory _name, string memory _symbol, uint _initialSupply) {
name = _name;
symbol = _symbol;
totalSupply = _initialSupply;
balanceOf[msg.sender] = _initialSupply; //allocating all balance to deployer of the token


    }
    function transfer(address _to , uint _value) public returns(bool){
        require (balanceOf[msg.sender] >=  _value," Not enough Balance");
        balanceOf[msg.sender] -= _value;
        balanceOf [_to] += _value;
        return true;
    }
    function stakeToken(uint _amount) public {
        require(balanceOf[msg.sender] >= _amount, " You cannot stake more than your balance");
        balanceOf [msg.sender] += _amount;
        stakingBalance[msg.sender] += _amount;
        tokenStaked += _amount;
        isStaking [msg.sender] = true;
    }
        function unstakeToken () public {
        require (isStaking [msg.sender] == true, "You have not staked any TOKENS");
        uint balance =stakingBalance [msg.sender];
        balanceOf [msg.sender] += 2*balance;
     stakingBalance[msg.sender] =0;
        isStaking[msg.sender] = false;
       
        }


        }
        
