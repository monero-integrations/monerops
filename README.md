# MoneroPS
A Prestashop addon for accepting Monero (XMR)

Compatible with the stable version of Prestashop (1.6.x). And working on 1.7.x

## Dependencies
This plugin is rather simple but there are a few things that need to be set up beforehand.

* A web server! Ideally with the most recent versions of PHP and mysql

* A Monero wallet. You can find the official wallet [here](https://getmonero.org/downloads/)

* [Prestashop](https://prestashop.com)
Prestashop is open source e-commerce engine to run your own shop and this Monero addon

## Step 1: Activating the plugin
* Downloading: First of all, you will need to download the module. You can download the latest release as a .zip file from https://github.com/monero-integrations/monerops If you wish, you can also download the latest source code from GitHub. This can be done with the command `git clone https://github.com/monero-integrations/monerops.git` or can be downloaded as a zip file from the GitHub web page.

* Unzip the file monerops-master.zip if you downloaded the zip from the master page [here](https://github.com/monero-integrations/monerops).

* Upload the module and activate it. You can refer the official documentation [here](https://addons.prestashop.com/en/content/21-how-to)

## Step 2 : Use your wallet address and connect to a Monero daemon

### Option 1: Running a full node yourself

To do this: start the Monero daemon on your server and leave it running in the background. This can be accomplished by running `./monerod` inside your Monero downloads folder. The first time that you start your node, the Monero daemon will download and sync the entire Monero blockchain. This can take several hours and is best done on a machine with at least 4GB of ram, an SSD hard drive (with at least 40GB of free space), and a high speed internet connection.
You can refer the official documentation for running full node from [here](https://github.com/monero-project/monero).

### Option 2: Connecting to a remote node
The easiest way to find a remote node to connect to is to visit [moneroworld.com](https://moneroworld.com/#nodes) and use one of the nodes offered. It is probably easiest to use node.moneroworld.com:18089 which will automatically connect you to a random node.

`Note: You must run your JSON RPC on the host server of Prestashop against your wallet`

### Setup your Monero wallet-rpc

* Setup a Monero wallet using the monero-wallet-cli tool. If you do not know how to do this you can learn about it at [https://github.com/monero-project/monero](https://github.com/monero-project/monero)
You can check out the monero wallet commands from [here](https://github.com/monero-project/monero/wiki/monero-wallet-cli-commands)


* Start the Wallet RPC and leave it running in the background. This can be accomplished by running `monero-wallet-rpc --wallet-file /path/to/wallet/file --password walletPassword --rpc-bind-port 18082 --disable-rpc-login` where "/path/to/wallet/file" is the wallet file for your Monero wallet. If you wish to use a remote node you can add the `--daemon-address` flag followed by the address of the node. `--daemon-address node.moneroworld.com:18089` for example.

## Step 4: Setup Monero Gateway in Prestashop
* Navigate to the "Modules and Services" panel in the Prestashop sidebar and identify `Monero Payments` module and click on `configure`.
* Update `Monero Wallet Address` and `Wallet RPC IP/HOST`
* Note: Wallet RPC IP should start with the protocol and end with port address. `Eg. http://127.0.0.1:18082`
* Save the changes and you are good to go.


## Donating Me
XMR Address : `44krVcL6TPkANjpFwS2GWvg1kJhTrN7y9heVeQiDJ3rP8iGbCd5GeA4f3c2NKYHC1R4mCgnW7dsUUUae2m9GiNBGT4T8s2X`
