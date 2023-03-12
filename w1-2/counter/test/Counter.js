const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");


describe("Counter", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployCounter() {

    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const Counter = await ethers.getContractFactory("Counter");
    const counter = await Counter.deploy();
    console.log("counter:", counter.address);
    return { counter, owner, otherAccount };
  }


  it("add1 ok", async function () {
    const { counter } = await loadFixture(deployCounter);
    await counter.add1();
    expect(await counter.total()).to.equal(1);

  });

  it("addx ok", async function () {
    const { counter } = await loadFixture(deployCounter);
    let tx = await counter.addx(10);

    expect(await counter.total()).to.equal(10);

  });



});
