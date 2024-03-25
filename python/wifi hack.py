import os
import platform
import getpass

def createNewConnection(name, SSID, key):
    config = f"""<?xml version="1.0"?>
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>{name}</name>
    <SSIDConfig>
        <SSID>
            <name>{SSID}</name>
        </SSID>
    </SSIDConfig>
    <connectionType>ESS</connectionType>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>WPA2PSK</authentication>
                <encryption>AES</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
            <sharedKey>
                <keyType>passPhrase</keyType>
                <protected>false</protected>
                <keyMaterial>{key}</keyMaterial>
            </sharedKey>
        </security>
    </MSM>
</WLANProfile>"""

    if platform.system() == "Windows":
        filename = f"{name}.xml"
        command = f"netsh wlan add profile filename=\"{filename}\" interface=Wi-Fi"
        with open(filename, 'w') as file:
            file.write(config)
        os.system(command)
        os.remove(filename)
    elif platform.system() == "Linux":
        command = f"nmcli dev wifi connect '{SSID}' password '{key}'"
        os.system(command)

def connect(name, SSID):
    if platform.system() == "Windows":
        command = f"netsh wlan connect name=\"{name}\" ssid=\"{SSID}\" interface=Wi-Fi"
    elif platform.system() == "Linux":
        command = f"nmcli con up {SSID}"
    os.system(command)

def displayAvailableNetworks():
    if platform.system() == "Windows":
        command = "netsh wlan show networks interface=Wi-Fi"
    elif platform.system() == "Linux":
        command = "nmcli dev wifi list"
    os.system(command)

try:
    displayAvailableNetworks()
    option = input("New connection (y/N)? ").lower()
    if option == "n":
        name = input("Name: ")
        connect(name, name)
        print("If you aren't connected to this network, try connecting with correct credentials")
    elif option == "y":
        name = input("Name: ")
        key = getpass.getpass("Password: ")
        createNewConnection(name, name, key)
        connect(name, name)
        print("If you aren't connected to this network, try connecting with correct credentials")
except KeyboardInterrupt:
    print("\nExiting...")
