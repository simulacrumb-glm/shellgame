// SPDX-License-Identifier: MIT
pragma solidity >=0.7.11;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Shellgame {

    uint256 number;
    uint256 pad;

    constructor() {
        number = random();
        pad = random();
    }

    //receive() external payable {}
    fallback() external payable {}

    function random() internal view returns (uint) {
        uint randomHash = uint(keccak256(abi.encode(block.timestamp)));
        return randomHash % 3;
    }

    function withdraw(uint winnings) internal {
        (bool success, ) = msg.sender.call{value:winnings}("");
        require(success, "withdraw() Transfer failed.");
    }

    function guess(uint256 guessValue) public payable{
        require(msg.value >= 1 ether, "You must pay 1 CFX per guess");
        if (number == guessValue){
            //win
            number = random();
            withdraw(2 ether);
        }else{
            //lose
            pad = random();
            withdraw(1);
        }

    }

    function retrieve() public view returns (uint256){
        return number;
    }
}
