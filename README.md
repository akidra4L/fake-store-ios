# fake-store-ios

A simple iOS app that displays a list of products fetched from an external API and includes promotional banners after every few products. The app is built using **Swift** and leverages modern design patterns and third-party libraries for cleaner and more maintainable code.

---

## Features

- Fetch and display products from an external API.
- Dynamically include promotional banners into the product list.
- Utilizes async/await for clean and efficient network requests.
- Highly modular structure for scalability and reusability.
- Seamless UI creation using SnapKit for auto-layout.

---

## Libraries Used

This project uses **Swift Package Manager (SPM)** for dependency management and includes the following libraries:

- **[Alamofire](https://github.com/Alamofire/Alamofire)**: For networking.
- **[Kingfisher](https://github.com/onevcat/Kingfisher)**: For asynchronous image downloading and caching.
- **[SnapKit](https://github.com/SnapKit/SnapKit)**: For auto-layout constraints.

---

## API Information

This app fetches product data from the [Fake Store API](https://fakestoreapi.com/), a free RESTful API for testing and prototyping e-commerce applications.

### Endpoints Used:

1. **GET /products**:
   - Fetches a list of all available products.
   - Example response:
     ```json
     [
       {
         "id": 1,
         "title": "Product Title",
         "price": 29.99,
         "description": "Product Description",
         "category": "Category Name",
         "image": "https://example.com/image.jpg"
       }
     ]
     ```

---

## Project Structure

The project is organized into the following modules:

### 1. **Flows**
   - **`HomeViewController`**:
     - Main view controller responsible for displaying products and promotional banners.
     - Handles user interface setup, table view management, and data binding.
   - **Views**:
     - All custom UI components used by the `HomeViewController` are defined here.

### 2. **Services**
   - **`NetworkClient`**:
     - A reusable networking class built using Alamofire for making API requests.
   - **`ProductsProvider`**:
     - Encapsulates business logic for fetching products and exposing them via an async/await method.

### 3. **Extensions**
   - Includes utility extensions for UIKit components, such as `UITableView` extensions for simplifying table view configurations.

---

## Installation

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/akidra4L/fake-store-ios.git
   cd fake-store-ios
   ```

2. Open the project in Xcode:
   ```bash
   open HomeProductsApp.xcodeproj
   ```

3. Install dependencies via SPM:
   - Open the **File** menu in Xcode.
   - Select **Add Packages...**.
   - Add the following package URLs:
     - Alamofire: `https://github.com/Alamofire/Alamofire`
     - Kingfisher: `https://github.com/onevcat/Kingfisher`
     - SnapKit: `https://github.com/SnapKit/SnapKit`

4. Build and run the project:
   - Select a simulator or a connected device.
   - Press **Cmd+R** to run the app.