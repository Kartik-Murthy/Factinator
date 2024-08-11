# Factinator

Factinator is a Flutter application designed to deliver random facts using the OpenAI API. It's a showcase of a clean architecture approach with a focus on separation of concerns and testability. 

## Features

* *Dynamic Fact Generation:* Utilizes the OpenAI API to fetch engaging and informative facts, ensuring a fresh experience every time.
* *Smooth Animations:* Integrates animated_text_kit for seamless text transitions, enhancing user engagement.
* *Attractive UI:* Leverages google_fonts for visually appealing typography and particles_flutter for a captivating background effect. 
* *Environment-Based Configuration:*  Employs envied for secure management of API keys and sensitive data across different environments.
* *Random Fact Generator:*  Generates random facts on a variety of topics.
* *User-Friendly Interface:* Easy to navigate and understand.
* *Visually Appealing Design:*  Uses animations and interesting color schemes.

## Project Structure

The project adheres to a layered architecture, promoting modularity and maintainability:


factinator/
├── lib/
│   ├── data/
│   │   ├── models/
│   │   │   └── fact.dart
│   │   ├── repositories/
│   │   │   └── fact_repository_impl.dart
│   │   └── datasources/
│   │       └── fact_remote_datasource.dart
│   ├── domain/
│   │   ├── repositories/
│   │   │   └── fact_repository.dart
│   │   └── usecases/
│   │       └── get_random_fact.dart
│   ├── presentation/
│   │   ├── widgets/
│   │   │   └── fact_display.dart 
│   │   ├── bloc/
│   │   │   └── fact_bloc.dart
│   │   └── pages/
│   │       └── home_page.dart
│   └── main.dart
├── .env.example
├── pubspec.yaml
├── ...


*Key Components:*

* *lib/data:* Contains the data access layer, responsible for interacting with the OpenAI API.
    * *models:*  Defines data structures like Fact to represent fact objects.
    * *repositories:* Implements concrete repositories like FactRepositoryImpl for fetching fact data.
    * *datasources:*  Handles direct communication with the OpenAI API through FactRemoteDatasource.

* *lib/domain:* Encapsulates the business logic of the application.
    * *repositories:*  Defines abstract repositories like FactRepository, providing a contract for data access.
    * *usecases:* Implements use cases like GetRandomFact to encapsulate specific business logic operations.

* *lib/presentation:*  Responsible for presenting data to the user.
    * *widgets:*  Reusable UI components like FactDisplay.
    * *bloc:*  Implements the BLoC pattern using FactBloc to manage the state of the fact retrieval.
    * *pages:*  Screen-level components like HomePage that orchestrate the UI and user interactions.

## Environment Configuration

1. Create a file named .env in the root directory.
2. Define your OpenAI API key as follows:

   
   OPENAI_API_KEY=YOUR_ACTUAL_API_KEY
   

3.  Run flutter pub run build_runner build to generate the envied configuration.

*Note:* Never commit your .env file to version control.  Use .env.example as a template.

## Running the App

1. Make sure you have Flutter installed and configured. 
2. Follow the steps in the "Getting Started" section of the basic README.

## Testing

This project emphasizes testability. You can run tests using:

bash
flutter test


## Future Enhancements

* Fact categorization
* User-specific fact preferences
* Offline fact storage


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
