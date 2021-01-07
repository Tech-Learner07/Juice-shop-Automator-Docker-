# Juice-shop-Automator-Docker-
Install OWASP Juice-Sop with docker and run Juice-Shop

# Installation
Run:
1. chmod +x install.sh
2. ./install.sh

After Installation just remove the file.

# Running...
To run the script:
1. chmod + x juice-shop.sh
2. ./juice-shop.sh <options>\n
    ./juice-shop.sh <PORT> -- to run juice-shop on the specified <PORt>\n
    ./juice-shop.sh kill   -- to kill all current running Docker Containers\n
  
# If you want to make it as a binary
1. Move juice-shop.sh to your desired location
    eg: mv juice-shop.sh /home/<username>/tools
  
2. Link the file to any bin directories using sudo ln -s
    eg: sudo ln -s /path/to/juice-shop.sh /usr/local/bin/juice-shop
  
3. chmod +x /path/to/real/juice-shop/file
  
4. Check all is correct by using which command 
    eg: which juice-shop
    
This will help you running the file by just typing the name
