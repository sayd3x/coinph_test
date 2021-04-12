Building requirements:
- Xcode 12.4 
Just open the project and build, no extra actions needed.


Dependencies are used during the coding assignment:
- SwiftPM
- Moya
- RxSwift


Project structure:
I tried to organize the project like a book. Everything is organized into directories where high abstractions go first. I thought it's best way to get acquanted with the project as you don't want to go into details rightaway but see only high level object and understand who they may interact with each other. The details is hidden behind subdirectories.
Also I used modular approach to implement the Wallets screen. The Wallet module is complitely detachable from the main app and the WalletsModuleBridge is used to attach the module to the app.


Screen layout:
As you can see I modified the layout of the screen and moved eash list in a dedicated page which you can see sliding left-right or using tab button on top. I made it basause of the issues of the main layout:
- It's hard to interact with the original layout (expecially top list) using big finger if you take phone in one hand
- It's difficult to look through all assets of transactions expecially when you have a huge amount of them.


Networking:
The network layer is hidden behid Repositories making possible to easily switch between different networking frameworks. I used Moya as the network layer as it allows you to implement things in the fast manner.

As requested I slightly improved format of responses to streamline developming of the API on client side.
Success responses for any endpoint should look like:
{
  "data": [
    {
      "balance": "1000.23",
      "id": "1001",
      "wallet_name": "PHP"
    },
    {
      "balance": "100.10",
      "id": "1002",
      "wallet_name": "USD"
    },
    {
      "balance": "0.000000000000010026",
      "id": "1003",
      "wallet_name": "ETH"
    }
  ]
}

Error responses should look like:
{
  "errors": [
    {
      "code": "no_items",
      "message": "No more items"
    }
  ]
}

Having that we can easily parse any type of data it into the generic BackendResponse structure.
Also taking into account amount of wallets/transactions could possibly much higher than 2-3 entries, I implemented pagination by adding page and limit arguments to /wallets and /histories endpoint which help to load data on demand.



