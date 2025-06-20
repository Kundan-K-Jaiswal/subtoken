const hre = require("hardhat");

async function main() {
  // Compile contracts if not already compiled
  await hre.run("compile");

  // Get the contract factory
  const SubToken = await hre.ethers.getContractFactory("SubToken");

  // Deploy the contract
  const subToken = await SubToken.deploy();

  // Wait for deployment to complete
  await subToken.deployed();

  console.log("SubToken deployed to:", subToken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
