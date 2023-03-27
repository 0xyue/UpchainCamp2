require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
const dotenv = require("dotenv");

dotenv.config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {},
    goerli: {
      url: process.env.GOERLI_RPC_URL,
      accounts: [process.env.PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_KEY
  },

};
