// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle) {
        HelperConfig helperConfig = new HelperConfig();
        (
            uint64 subscriptionId,
            bytes32 gasLane,
            uint256 automationUpdateInterval,
            uint256 raffleEntranceFee,
            uint32 callbackGasLimit,
            address vrfCoordinatorV2,
            address link,
            uint256 deployerKey
        ) = helperConfig.activeNetworkConfig();

        vm.startBroadcast(deployerKey);
        Raffle raffle = new Raffle(
            subscriptionId,
            gasLane,
            automationUpdateInterval,
            raffleEntranceFee,
            callbackGasLimit,
            vrfCoordinatorV2
        );
        vm.stopBroadcast();
    }
}
