# QuickHelp


## Getting Started with QuickHelp Mobile App

This project is a Flutter-based mobile application designed to provide quick and efficient help services.


### Prerequisites

- Install [Flutter](https://flutter.dev/docs/get-started/install) on your system.
- Ensure you have an IDE like [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with Flutter and Dart plugins installed.
- Set up an emulator or connect a physical device for testing.
- Install [Node.js](https://nodejs.org/) for running the backend server.


### Create .env file

1. Create a `.env` file in the root directory of the Node.js backend.

2. Add the following environment variables to the `.env` file:
    ```plaintext
    MONGODB_URI=mongodb://localhost:27017/quickhelp
    PORT=5000
    ```


### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/QuickHelp.git
    cd QuickHelp
    ```

2. Fetch the dependencies for the Flutter app:
    ```bash
    flutter pub get
    ```

3. Run the Flutter app:
    ```bash
    flutter run
    ```

4. Fetch the dependencies for the Node.js backend:
    ```bash
    npm install
    ```
5. Run the Node.js backend server:
    ```bash
    npm run dev
    ```



### Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

### License

This project is licensed under the MIT License. See the `LICENSE` file for details.