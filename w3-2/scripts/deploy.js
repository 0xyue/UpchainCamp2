const { ethers, upgrades } = require("hardhat");
const { getImplementationAddress } = require('@openzeppelin/upgrades-core');

async function main() {

  // Deploying
  const MyERC20V1 = await ethers.getContractFactory("MyERC20V1");
  const instance = await upgrades.deployProxy(MyERC20V1);
  await instance.deployed();

  console.log(`MyERC20: npx hardhat verify ${instance.address} --network goerli`);

  // Upgrading
  const MyERC20V2 = await ethers.getContractFactory("MyERC20V2");
  const upgraded = await upgrades.upgradeProxy(instance.address, MyERC20V2);

  let currentImplAddress = await getImplementationAddress(ethers.provider, upgraded.address);
  console.log(`Please verify MyERC20V2: npx hardhat verify ${currentImplAddress} --network goerli`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
