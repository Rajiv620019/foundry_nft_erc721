// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import "../src/DogieNft.sol";

contract DeployDogieNft is Script{
    function run() external returns (DogieNft) {

        vm.startBroadcast();
        DogieNft dogieNft = new DogieNft();
        vm.stopBroadcast();
        return dogieNft;
    }
}
