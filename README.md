# 💻 SSH Auth Logger

This setup allows you to automatically log user attempts to connect to SSH, including successful and failed attempts, and send notifications to a Discord webhook. The provided script logs the authentication events, including the IP address, and sends a message to the specified webhook.

## Prerequisites

- A Linux system with SSH server installed
- `curl` command-line tool installed
- Discord webhook URL

## ⚙ Installation and Configuration  

1. Open the SSH configuration file:
   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. Update the following lines in the sshd_config file:
    ```bash
    LogLevel VERBOSE
    ForceCommand /path/to/log_auth.sh
    ```

3. Replace /path/to/log_auth.sh with the actual path where you plan to store the logging script.

4. Save the changes and exit the text editor.

5. Create a new script named log_auth.sh with the provided logging logic. Replace your_webhook_url_here in the script with your actual Discord webhook URL.

5. Make the script executable:
    ```bash
    chmod +x /path/to/log_auth.sh
    ```

6. Restart the SSH service:
    ```bash
    sudo systemctl restart sshd
    ```


## Usage
Once the setup is complete, every user attempt to connect to SSH will be logged and sent to the specified Discord webhook. The log messages include the IP address and indicate whether the authentication was successful or failed.

## License
This project is licensed under the MIT License.