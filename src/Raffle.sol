// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

/**
 * @author  Zainab OUFQIR
 * @title   A simple raffle contract
 * @dev     Implements Chainlink VRFv2
 * @notice  This contract is for creating a simple raffle
 */

contract Raffle {
    /** Errors */
    error Raffle__NotEnoughEthSent();

    uint private immutable i_entranceFee;
    address payable[] private s_players;

    /** Events */
    event EnteredRaffle(address indexed player);

    constructor(uint _entranceFee) {
        i_entranceFee = _entranceFee;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));

        emit EnteredRaffle(msg.sender);
    }

    function getEntranceFee() external view returns (uint) {
        return i_entranceFee;
    }
}
