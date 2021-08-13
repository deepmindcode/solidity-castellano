// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Lottery {
    address public owner;
    uint256 minBet;
    address public payable winner;
    uint256 public pot;

    constructor() {
        owner = msg.sender;
        minBet = 1 ether;
    }

    struct Participant {
        address player;
    }

    event Winning(address winner, uint256 quantity);
    event NewBet(address better, uint256 number);

    mapping(address => uint256) public players;

    function random() public view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        players.length
                    )
                )
            );
    }

    function newBet() public {
        require([players].bet == minBet, "Minimum bet required");
        [players].player == msg.sender;
        pot += minBet;
    }

    function pickWinner() public returns (address _winner) {
        require(players.length >= 2, "3 participants allowed");
        uint256 r = random();
        uint256 index = r % players.length;
        winner = players[index];
    }

    function win() public payable {
        emit Winning(winner, pot);
        winner.transfer(address(this).balance);
    }
}
