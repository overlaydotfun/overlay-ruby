# overlay-ruby

A Ruby library for **Web3 development** that makes it easy to implement wallet creation, token and NFT issuance, minting, burning, and transfers across multiple blockchains.

---

## 📖 Overview

**Overlay** enables simple Web3 development across multiple blockchains, including:
- **Solana** 
- **Ethereum**
- **BSC (Binance Smart Chain)**
- **Base**
- **Polygon** 
- **Bera Chain**

It eliminates the need for signing transactions with wallets, which is typically necessary in blockchain development. Overlay implements high-level security features and securely encrypts wallet information to safely execute transactions without storing any database locally.

---

## 🚀 Installation

Add this line to your application's **Gemfile**:

```ruby
gem "overlay-ruby"
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install overlay-ruby
```

---

## ⚙️ Configuration

Before using the library, you need to configure your API credentials:

```ruby
Overlay.configure do |config|
  config.api_key = 'your_api_key'
  config.auth_key = 'your_auth_key'
  config.env = 'devnet' # or 'mainnet'
end
```

### 🌐 Environment Options

| Environment | URL | Description |
|-------------|-----|-------------|
| `devnet` | `https://devnet.overlay.fun` | Development environment |
| `mainnet` | `https://mainnet.overlay.fun` | Production environment |

---

## 📘 Usage

### 👛 Wallet Management

#### Create a Wallet

```ruby
# Create a new wallet
response = Overlay::Wallet.create({
  network: "solana" # or "evm"
})

puts response
```

### 🪙 Token Operations

#### Create a Token

```ruby
# Create a new token
response = Overlay::Token.create({
  network: "solana", # or "eth" "base" "bsc" "blast" "polygon" "bera" "monad" etc
  name: "My Token",
  symbol: "MTK",
  image: "image url",
  supply: 1000000000,
  decimals: 9,
  # Add other token parameters
})

puts response
```

#### Mint Tokens

```ruby
# Mint tokens to an address
mint_address = "your_token_mint_address"
response = Overlay::Token.mint(mint_address, {
  network: "solana",
  amount: 1000
})

puts response.success
```

#### Transfer Tokens

```ruby
# Transfer tokens between addresses
response = Overlay::Token.transfer(mint_address, {
  network: "solana",
  amount: 1000,
  recipient: "recipient_address"
})
```

#### Burn Tokens

```ruby
# Burn tokens
response = Overlay::Token.burn(mint_address, {
  network: "solana",
  amount: 1000
})
```

### 🖼️ NFT Operations

#### Create an NFT

```ruby
# Create a new NFT collection or individual NFT
response = Overlay::NFT.create({
  network: "solana",
  name: "My NFT",
  symbol: "MNFT",
  description: "A unique NFT",
  image_url: "https://example.com/image.png",
  # Add other NFT metadata
})

puts response.success
```

#### Mint NFTs

```ruby
# Mint an NFT
mint_address = "your_nft_mint_address"
response = Overlay::NFT.mint(mint_address, {
  network: "solana"
})
```

#### Transfer NFTs

```ruby
# Transfer an NFT
response = Overlay::NFT.transfer(mint_address, {
  network: "solana"
  recipient: "new_owner"
})
```

#### Burn NFTs

```ruby
# Burn an NFT
response = Overlay::NFT.burn(mint_address, {
  network: "solana"
})
```

---

## 📦 Response Object

All methods return an `Overlay::Response` object with the following structure:

```ruby
response = Overlay::Token.create(params)

# Access response properties
puts response.success    # Boolean indicating success/failure
puts response.message    # Response message
puts response.data       # Response data hash

# Data properties are also accessible directly
puts response.mint_address if response.data["mint_address"]
```

---

## ⚠️ Error Handling

The library includes built-in error handling. Always check the `success` property of the response:

```ruby
response = Overlay::Token.mint(mint_address, { amount: 1000 })

if response.success
  puts "✅ Token minted successfully!"
  puts "Transaction ID: #{response.transaction_id}"
else
  puts "❌ Error: #{response.message}"
end
```

---

## 🌍 Supported Blockchains

- 🔥 **Solana**
- ⚡ **Ethereum**
- 💛 **Binance Smart Chain (BSC)**
- 🔵 **Base**
- 🟣 **Polygon**
- 🐻 **Bera Chain**

---

## 🔐 Security Features

- ✅ **No local database storage**
- 🔒 **Secure wallet encryption**
- 🛡️ **High-level security implementation**
- 🔑 **Safe transaction execution without exposing private keys**

---

## 📋 Requirements

- **Ruby** >= 3.3.0

## 📦 Dependencies

- `httpx` - HTTP client for API requests

---

## 🛠️ Development

After checking out the repo, run:

```bash
bundle install
```

---

## 🤝 Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/overlaydotfun/overlay-ruby](https://github.com/overlaydotfun/overlay-ruby).

---

## 📚 Documentation

For more detailed documentation, visit: [https://docs.overlay.fun](https://docs.overlay.fun)

---

## 📄 License

This gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

---

## 📞 Contact

- 📧 **Email**: contact@overlay.fun
- 🌐 **Website**: https://overlay.fun
- 📖 **Documentation**: https://docs.overlay.fun