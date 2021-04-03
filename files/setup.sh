printf "############################################################################################# \n"
printf "#     Script for installing the Althea node by Paul D. Lovette | 04-02-2021                 # \n"
printf "#     Find me at https://skynet.paullovette.com/ or E-Mail: skynet@paullovette.com          # \n"
printf "#     While I have tested this script and it works great on my Ubuntu 20.0.4 install        # \n"
printf "#                                                                                           # \n"
printf "#               >>  No warranty is expressed. User assumes all risk  <<                     # \n"
printf "############################################################################################# \n \n \n"

printf "\n";
printf "$(date) *** Let create a wallet without a Ledger device *** \n";

read -p 'Enter a name for your new Key: ' KEY_NAME;

printf "\n";
printf "$(date) Key name entered: $KEY_NAME \n";

althea keys add $KEY_NAME;

printf "\n";
printf "$(date) *** STOP *** Copy the displayed key above! *** \n";

printf "\n";
printf "$(date) *** STOP *** Copy the displayed mnemonic above! *** \n";

printf "\n";
printf "$(date) *** PAUSING 30 SECONDS *** Copy/Write down the displayed ADRESS & MNEMONIC above! *** \n";

printf "\n";
printf "$(date) Setting up the Geth Ethereum Light Client \n";

cd ~/
tar -xvf geth-linux-amd64-1.10.1-c2d2f4ed.tar.gz

chmod +x /home/$USER/geth-linux-amd64-1.10.1-c2d2f4ed/geth
sudo cp /home/$USER/geth-linux-amd64-1.10.1-c2d2f4ed/geth /usr/bin/geth

printf "\n";
printf "$(date) Finalizing Gravity Bridge Services \n";

sed -i "s/^User=.*/"User=$USER"/" /home/$USER/althea-bin/gravity-bridge.service
sed -i "s/^User=.*/"User=$USER"/" /home/$USER/althea-bin/geth.service

sudo cp /home/$USER/althea-bin/gravity-bridge.service /lib/systemd/system/gravity-bridge.service
sudo cp /home/$USER/althea-bin/geth.service /lib/systemd/system/geth.service

printf "\n";
printf "$(date) Enable and start the Gravity Bridge and Geth system services: \n";

sudo systemctl enable gravity-bridge.service
sudo systemctl start gravity-bridge.service

sudo systemctl enable geth.service
sudo systemctl start geth.service

printf "\n";
printf "$(date) *** Allow your node to completely sync before proceeding with Enable and start the Gravity Bridge and Geth system services: *** \n";

printf "\n";
printf "$(date) You can view what Althea is doing by typing 'sudo journalctl -fu gravity-bridge' \n";

printf "\n";
printf "$(date) Type 'althea status' + ENTER.  In the output you should see "Catching Up = False" once synced. \n";
