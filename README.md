# OnionServiceDocker

OnionServiceDocker is a project aimed at simplifying the process of publishing an .onion website. It is designed to help you avoid the need for registering a domain name or leaking an IP address. This project is built on Docker, using Alpine Linux as the base image, and includes Tor and Nginx for serving the website.

# SECURITY WARNING

Keep the secret key used in production secret!, don't run with debug turned on in production!
Runing this project in production is not recommended, this is just a demo project
This project is not secure, it is just a demo project
This project is not optimized, it is just a demo project
Using the current keys in production can lead to RCE and other security issues, make sure to change them and turn the debug off before using in production. 
(As this project directly exposes the Django server to the internet, consider runing it without reading and changing the code as runing it in production, it is just a demo project)

You have been warned!

## Features

- Easy setup: Just clone the repository and build the Docker image.
- No need for domain registration: Your site will be accessible via a Tor .onion address.
- IP address protection: Your server's real IP address is not exposed to the public.

## Usage

1. Clone this repository.
2. Modify the code to suit your needs and avoid security issues.
3. Build the Docker image using the provided Dockerfile.
4. Run the Docker container.

### Example

```bash
git clone
cd OnionServiceDocker
docker build -t onionservicedocker .
docker run -it --rm onionservicedocker

# During de development process you can run the container with the following command
docker run -it --rm onionservicedocker sh

# Debug the nginx server
docker run -it --rm -p 80:80 onionservicedocker

# Debug the django server
docker run -it --rm -p 8000:8000 onionservicedocker
```


## Development Status

Please note that this project is still under development and should not be considered 100% secure. It is recommended to use this for testing and development purposes only until a stable release is available.

## Contributing

Contributions are welcome! Please feel free to submit a pull request.

## License

This project is licensed under the WTFPL license. See the [Wikipedia page](https://fr.wikipedia.org/wiki/WTFPL) file for more details.

## Disclaimer

This project is not affiliated with or endorsed by The Tor Project. Use at your own risk.  
See the [Tor Project website](https://www.torproject.org/) for more information, also this page explain [How To Setup an Onion Service](https://community.torproject.org/onion-services/setup/) .

Any use of this project for illegal purposes is strictly prohibited.

## Contact

For any inquiries, please open an issue on the GitHub repository. Or contact me via email at [ask@4skl.com](mailto:ask@4skl.com).

## Now Working On

- Add support for different stacks

## Future Plans

- Improve security measures.
- Add more configuration options.
- Provide detailed setup and usage instructions.
- Add support for other web servers (e.g., Apache, Nginx, etc.).
- Add support for other operating systems (e.g., Debian, Ubuntu, etc.).
- Move I2P support to a separate project.

## Donations (optional)

If you find this project useful, please consider making a donation to support its development.

XMR (Monero): 83fxvbkP8M1DzRSEtoEqNN9qmMD7c1HN1G535GLx424dQGZj3dagHqbP9T2yRF3c9BMV3LZ2s7zHYF9cWBRfCraLBt9EdRq