//The previous script but here we r calling contract functions using ethers
//about promise, then, catch, finally : https://www.freecodecamp.org/news/javascript-promise-methods/
//async func will be our main script to deploy our SimpleStorage.sol file
//After we write our contract in remix, the first step we do is compile it, here we will compile it with the help of solc-js
//http://172.18.32.1:7545

const ethers = require("ethers");
const fs = require("fs-extra");

async function main() {
  const provider = new ethers.providers.JsonRpcProvider(
    "http://172.18.32.1:7545"
  );

  const wallet = new ethers.Wallet(
    "5f6c0f1402340aff2320cfb0716bdf6c24d0e92631852d4c6ecc744ac85fcb16",
    provider
  );

  const abi = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage1.abi",
    "utf-8"
  );
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf-8"
  );

  const contractfactory = new ethers.ContractFactory(abi, binary, wallet);
  //abi : so that the code knows how to interact with the contract
  //binary: thats the main logic/code
  //wallet : so that it knows which network(RPC URL) and the pvt key

  console.log("Deploying......Please Wait");
  const contract = await contractfactory.deploy();
  //const transactionReceipt = await contract.deployTransaction.wait(1); //wait for 1 block to mine our block in the chain
  await contract.deployTransaction.wait(1);
  // commenting the above 3 lines when deploying with only transaction details

  //calling retrieve function from the contract. retrieve won't cost any gas since it is a view function
  const currentfavnumber = await contract.retrieve();
  console.log(currentfavnumber.toString());
  const transactionResponse = await contract.store("7"); //when we call a function on the contract we get a transaction REsponse
  console.log(transactionResponse); //to see the diff between transactionResponse and transactionReceipt
  const transactionReceipt = await transactionResponse.wait(1); //when the response is executed, we get a transaction receipt
  console.log(transactionReceipt);
  const updatedFavNumber = await contract.retrieve();
  console.log(`updated fav number is : ${updatedFavNumber}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
