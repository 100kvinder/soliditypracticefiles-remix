
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Largest{

uint [] arr;
function pushNum(uint _num) public {
    arr.push(_num);
}
function viewArr() public view returns(uint [] memory){
    return arr;
}
function largest () public view returns (uint){
    uint temp =arr[1];

    for (uint i=1;  i < arr.length; i++){
if (arr[i] > temp){
    temp = arr[i];
}}
return temp;
    }
}


