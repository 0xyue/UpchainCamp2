// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const YueERC20 = await hre.ethers.getContractFactory("YueERC20");
  const yueERC20 = await YueERC20.deploy();

  await yueERC20.deployed();

  console.log(
    `yueERC20 deployed to ${yueERC20.address}`
  );
  // 0xa1A97eb816Ce87E99409Ebe9ce15abC5436cd9A2


  const YueNFT = await hre.ethers.getContractFactory("YueNFT");
  const yueNFT = await YueNFT.deploy();

  await yueNFT.deployed();

  console.log(
    `yueNFT deployed to ${yueNFT.address}`
  );
  // 0x93e4a122889F838eb7e99101a618878f2F4A027a

  const YueVault = await hre.ethers.getContractFactory("YueVault");
  const yueVault = await YueVault.deploy(yueERC20.address);

  await yueVault.deployed();

  console.log(
    `yueVault deployed to ${yueVault.address}`
  );


  const YueNFTMarket = await hre.ethers.getContractFactory("YueNFTMarket");
  const yueNFTMarket = await YueNFTMarket.deploy(yueERC20.address, yueNFT.address);

  await yueNFTMarket.deployed();

  console.log(
    `yueNFTMarket deployed to ${yueNFTMarket.address}`
  );





}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
