from brownie import *
import scripts.deploy_contracts as deployer

def setup():
    global potatoInstance
    deployer.main()
    metaCoinInstance = Potato[0]

def initial_balance():
    '''should put 10000 MetaCoin in the first account'''
    balance = potatoInstance.getBalance(accounts[0])
    
    check.equal(balance, 10000, "10000 wasn't in the first account")

def library_fn():
    '''should call a function that depends on a linked library'''
    metaCoinBalance = metaCoinInstance.getBalance(accounts[0])
    metaCoinEthBalance = metaCoinInstance.getBalanceInEth(accounts[0])
    
    check.equal(metaCoinEthBalance, 2 * metaCoinBalance, 'Library function returned unexpected function, linkage may be broken')