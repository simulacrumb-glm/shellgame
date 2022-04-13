# shellgame
A simple shell game solidity contract extended from ChainIDE Storage template

Call guess with 0, 1, or 2 and payment. Random chance of winning. 
Gas is managed for CVM so that winning and losing guesses cost the same in the wallet.
If guess is correct, 3 cfx is returned and a new random number is generated
retrieve() is public for testing, make private or admin only if deployed to mainnet
