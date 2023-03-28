# 作业

部署⼀个可升级的 ERC20 Token 

• 第⼀版本 

• 第⼆版本，加⼊⽅法：function transferWithCallback(address recipient, uint256 amount) external returns (bool)

# 作业记录

代理合约 : 0x4BDD9854155D08D4a3ddCB2535b829a2c2C54c91

admin 合约 : 0x272017c20e7039d1e6D9A8daCA50cA1072471c24

MyERC20V1 合约 : 0xcd7D3d2ED10424005651bd0dF03B6Cf34d7E3162

MyERC20V2 合约 : 0x59ec2CAD76a2f9Adb868c6eb353EA2b549C32e3f
 


# error记录

## #1
error：

> TypeError: Cannot read properties of undefined (reading 'deployProxy')
> at main (/Users/ly/Downloads/project_workspace/UpchainCamp2/w3-2/scripts/deploy.js:8:35)

解决：

在 ```hardhat.config.json``` 中加入 ```require('@openzeppelin/hardhat-upgrades');```
