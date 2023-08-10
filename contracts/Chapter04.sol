// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

/**
 * 流程控制流程控制 Selection and Repetition
 */
 contract IfElse {

     function isEvenNumber(uint _number) public pure returns (bool) {
         if (_number % 2 == 0) {
             return true;
         } else {
             return false;
         }
     }

    /*
     if (expression 1) {

     } else if (expression 2) {

     } else if (expression 3) {

     } else {

     }
     */

     function isEvenNumber_tri(uint _number) public pure returns (bool) {
         return (_number % 2 == 0 ? true : false);
     }
 }

 contract Loop {

     uint[] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

     function countEvenNumbers() public view returns (uint) {
         uint count = 0;

         for (uint i = 0; i < numbers.length; i++) {
             if (isEvenNumber(numbers[i])) {
                 count++;
             }
         }
         
         return count;
     }

     function countEvenNumbersByWhile() public view returns (uint) {
         uint count = 0;
         uint i = 0;
         while (i < numbers.length) {
             if (isEvenNumber(numbers[i])) {
                 count++;
             }
             i++;
         }
         return count;
     }

     function isEvenNumber(uint _number) public pure returns (bool) {
         return (_number % 2 == 0 ? true : false);
     }
 }