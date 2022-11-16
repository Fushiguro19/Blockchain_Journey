const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL);

  //const wallet = new ethers.Wallet(process.env.PVT_KEY, provider);
  //commenting out the above statement to use encryptedKey.json file to access key

  const encryptedJson = fs.readFileSync("./.encryptedKey1.json", "utf-8"); //reading from the encryptedKey file and creating an encrypted instance
  let wallet = new ethers.Wallet.fromEncryptedJsonSync(
    encryptedJson,
    process.env.PWD
  ); //decrypts the encrypted key by taking in 2 arguments, the encrypted instance we created above and the pwd
  //although we deleted the PWD variable form the env file, we can access it by directly
  //mentioning it in the terminal: PWD=....  node deploy.js command
  //connecting the wallet to the provider
  wallet = await wallet.connect(provider);

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
