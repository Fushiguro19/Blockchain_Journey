//to encrypt pvt key

const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  const wallet = new ethers.Wallet(process.env.PVT_KEY);
  const encryptedJsonKey = await wallet.encrypt(
    process.env.PWD,
    process.env.PVT_KEY
  ); //variables defined in the .env file : PWD, PVT_KEY
  //returns a locally stored encrypted key that can be access only via a pwd
  //takes in 2 parameters : pwd and a pvt key
  //create pwd in .env file
  console.log(encryptedJsonKey);
  fs.writeFileSync("./.encryptedKey1.json", encryptedJsonKey);
  //writing the encrypted version of our key into a new file
  //add this new file to .gitignore
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
