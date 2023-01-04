import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Count", function() {
    async function deployFixture() {
        const [owner, otherAccount] = await ethers.getSigners();

        const CountContract = await ethers.getContractFactory("Count");
        const countcontract = await CountContract.deploy();
    
        return { countcontract, owner, otherAccount };
    }
    describe("Basic Info", function() {
        it("Shuld return token name", async function (){
            const { countcontract } = await loadFixture(deployFixture);
            expect(await countcontract.name()).eq("CountTestToken"); 
        });

        it("Shuld return symbol", async function (){
            const { countcontract } = await loadFixture(deployFixture);
            expect(await countcontract.symbol()).eq("CTT");
        });

        it("Shuld return totalSupply", async function (){
            const { countcontract } = await loadFixture(deployFixture);
            expect(await countcontract.totalSupply()).eq(1000); 
        });

    })
    describe("Some Info", function() {
        it("Should transfer tokens between users", async () => {
            const { countcontract, owner, otherAccount } = await loadFixture(deployFixture);

        });
    });
})
