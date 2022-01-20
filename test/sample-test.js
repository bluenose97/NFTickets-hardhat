const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("EventFactory", function () {
  it("Should return the number of events after creating an event", async function () {
    const EventFactory = await ethers.getContractFactory("EventFactory");
    const eventFactory = await EventFactory.deploy();
    await eventFactory.deployed();

    const ceateEventTx = await eventFactory.createEvent(
      "Name",
      "Location",
      100
    );

    // wait until the transaction is mined
    await ceateEventTx.wait();

    expect(await eventFactory.getNumberOfEvents()).to.equal(1);
  });
});
