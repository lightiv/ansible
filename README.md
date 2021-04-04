# Gravity Bridge Validator Setup Instructions:

## Prerequisites

### Setup base install of Linux.  I use Ubuntu 20.04.  Follow this guide:

[Linux setup and hardening page](https://github.com/lightiv/SkyNet/wiki/Ubuntu-Linux-Install-Guide)


### Fork this repository and clone it to your local PC

### Setup Ansible Control Workstation

Install Ansible:
```
sudo apt install ansible
```

Edit the inventory files to the IP address for the server(s) that your will me managing with Ansible

Edit the ansible.cfg to point to your SSH private key: 
```
private_key_file = 
```

## Step 1 - Configure your remote Gravity-Bridge node

From the Gravity Bridge git directory run:

```
ansible-playbook --ask-become-pass gravity-full-v005.yml
```

You will be prompted for various username and/or passwords.  Use the NON-ROOT user from the above "Setup base install of Linux."

## Step 2 - Log into your Gravity Bridge node with the NON-ROOT user from above

Run the following script and answer the prompts appropiately
```
~/althea-bin/setup1.sh
```

After the script finishes, move the the next step.


### Let your node sync before moving forward

Run the following command and look for "catching_up":false. If this says 'true' you are still syncing.

```
althea status
```

## Request some funds be sent to your address

Find your address.  Copy it from above when you created it or type the following:

```
althea keys list
```

Enter your keyring password and press ENTER

```
Copy your address from the 'address:' field and paste it into the command below
```

Looks like this: cosmos1xxxxxxxxxxxx.....xxxx

```
curl -vv -XPOST http://testnet1.althea.net/get_altg/cosmos1xxxxxxxxxxxx.....xxxx
```

This will provide you 10 ALTG from the faucet storage.
