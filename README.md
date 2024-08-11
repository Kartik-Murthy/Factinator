# Factinator

Factinator is a Flutter application that provides a fun and informative way to learn interesting facts. It fetches random facts from an API and displays them in a visually appealing and user-friendly interface.

## Features

* *Random Fact Generator:*  Generates random facts on a variety of topics.
* *User-Friendly Interface:* Easy to navigate and understand.
* *Visually Appealing Design:*  Uses animations and interesting color schemes.

## Architecture

ascii
                                      +-------------+
                                      | Factinator  |
                                      +-------------+
                                            |
                          +----------+      |    +----------+
                          | UI         |    |    | Data Model |
                          +----------+      |    +----------+
                          |            |         |            |
                          |  - Widgets |         | - Fact     |
                          |  - Layouts |         | - Category |
                          |            |         |            |
                          +----------+ |         +----------+
                                             |
                                      +----------+
                                      | API Client |
                                      +----------+
                                             |
                                      +----------+
                                      | API Server |
                                      +----------+


*UI:* The user interface is responsible for displaying facts, interacting with the user, and controlling navigation.

*Data Model:* Holds the data for the facts, including text, category, and any relevant details.

*API Client:* Handles communication with the API server to fetch new facts.

*API Server:* Provides a database of facts and endpoints for accessing them.

## Getting Started

1. *Install Flutter:* [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2. *Clone the repository:*
   bash
   git clone https://github.com/your-username/factinator.git
   
3. *Navigate to the project directory:*
   bash
   cd factinator
   
4. *Install dependencies:*
   bash
   flutter pub get
   
5. *Run the app:*
   bash
   flutter run
   

## Contributing

Contributions are welcome! 

1. Fork the repository.
2. Create a branch for your feature or bug fix.
3. Make your changes and test thoroughly.
4. Commit your changes with a clear and concise message.
5. Push your changes to your fork.
6. Submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

* [OpenAI](https://platform.openai.com/) for the API used to generate facts.
* The Flutter community for providing excellent resources and support.

## Contact

For any questions or suggestions, please feel free to contact me.

*Enjoy learning interesting facts with Factinator!*
