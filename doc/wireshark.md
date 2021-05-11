### WIRESHARK
install wireshark and let non-su sniff in dumpcap when prompted




open wireshark (without sudo) if you don'T see the interfaces execute:
sudo usermod -aG wireshark $(whoami)
then restart this will add wireshark to the group that can sniff

