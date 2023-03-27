# 练习题

## 练习1
- 发⾏⼀个 ERC20 Token（⽤⾃⼰的名字）， 发⾏ 100000 token

- 编写⼀个⾦库 Vault 合约：

    - 编写 deposite ⽅法，实现 ERC20 存⼊ Vault，并记录每个⽤户存款⾦额（approve/transferFrom）

    - 编写 withdraw ⽅法，提取⽤户⾃⼰的存款

- 进阶练习：

    - 使⽤ ERC2612 标准 Token ， 使⽤签名的⽅式 deposite

    - 参考视频:https://learnblockchain.cn/video/play/274


## 练习2
- 发⾏⼀个 ERC721 Token（⽤⾃⼰的名字）

    - 铸造 ⼀个 NFT，在测试⽹上发⾏，在 Opensea 上查看

- 编写⼀个合约：使⽤⾃⼰发⾏的ERC20 Token 来买卖NFT：

    - NFT 持有者可上架 NFT（list 设置价格 多少个 TOKEN 购买 NFT ）

    - 编写购买NFT ⽅法，转⼊对应的TOKEN，获取对应的 NFT


## 练习合约地址

yueERC20 : 0xa1A97eb816Ce87E99409Ebe9ce15abC5436cd9A2

yueNFT : 0x93e4a122889F838eb7e99101a618878f2F4A027a

yueVault : 0xd392D6Aa1cBA98528cF72E0Ea1eCF20D706c6b64

yueNFTMarket : 0x15b786cA26D17Dd9dC27Ce49406f8aB513491d71




# 课件
https://img.learnblockchain.cn/pdf/camp2/camp_w3_1.pdf

# 备忘
ERC20 : https://github.com/ethereum/EIPs/issues/20

OpenZeppelin 文档 : https://docs.openzeppelin.com/contracts/4.x/

OpenZeppelin 代码库 : https://github.com/OpenZeppelin/openzeppelin-contracts

安装 : npm install @openzeppelin/contracts

solmate（省gas）: https://github.com/transmissions11/solmate

安装 : npm install solmate

eip777 : https://learnblockchain.cn/docs/eips/eip-777.html

erc777 : https://learnblockchain.cn/2019/09/27/erc777

Uni permit2 : https://github.com/Uniswap/permit2

# 问题

## #1、import openzeppelin error
**error**

Source "@openzeppelin/contracts/token/ERC721/ERC721.sol" not found: File import callback not supported

**解决方法**
https://stackoverflow.com/questions/72013828/source-openzeppelin-contracts-token-erc721-erc721-sol-not-found-file-import

If you have "Solidity by Juan Blanco" for Truffle and "Solidity by Nomic Foundation" for Hardhdat, and if you are using Hardhat, disable the one by Juan Blanco and just use the one by Nomic Foundation, it just worked for me.

