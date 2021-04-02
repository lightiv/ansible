printf "############################################################################################# \n"
printf "#     Script for installing the Akash node by Paul D. Lovette | 02-02-2021                  # \n"
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
