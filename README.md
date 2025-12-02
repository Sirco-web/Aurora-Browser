<p align="center"><img src="https://raw.githubusercontent.com/titaniumnetwork-dev/Ultraviolet-Static/main/public/uv.png" height="200"></p>

<h1 align="center">Aurora Browser</h1>

<p align="center">
  A sophisticated, Chrome-like web proxy browser interface built on Scramjet technology.
</p>

Aurora provides a familiar browsing experience running entirely within a web page. It leverages advanced proxy technology to bypass censorship and access websites in a secure, sandboxed environment.

## 🌟 Features

- **Familiar UI**: Full tab management, URL bar, history, and bookmarks system.
- **Scramjet Powered**: Uses high-performance proxying to render modern web content.
- **Extension System**: robust API for modifying browser behavior, injecting CSS, and adding features.
- **Game Mode**: A dedicated performance mode that strips away UI effects, disables logging, and enforces single-tab usage for maximum FPS in browser games.
- **Marketplace**: Built-in extension marketplace to discover and install add-ons.
- **Themes**: Support for Dark, Light, and custom CSS themes.
- **DevTools**: Internal developer tools for inspecting the DOM, console logging, and network monitoring within the proxy context.

## 🚀 Internal Pages

Navigate using the `aurora://` protocol:

- `aurora://home` - The new tab dashboard.
- `aurora://settings` - Configure search engine, themes, and performance mode.
- `aurora://extensions` - Manage installed extensions and browse the marketplace.
- `aurora://history` - View and manage browsing history.
- `aurora://bookmarks` - Access saved pages.

## 🧩 Extensions

Aurora features a custom extension architecture allowing you to write JavaScript plugins that interact with the browser internals.

- **Install**: Load extensions via URL or by pasting code directly in the Extensions page.
- **Develop**: Check out [EXTENSIONS.md](EXTENSIONS.md) for the complete API reference and examples.

## 🎮 Game Mode

Found in **Settings**, Game Mode optimizes the browser for heavy web games:
1. **Disables** background logs and network tracking.
2. **Removes** expensive CSS filters (blur) and shadows.
3. **Enforces** a single active tab to dedicate resources to the game.
4. **Optimizes** iframe rendering layers.

## 🛠️ Deployment & Usage

### Prerequisites
- Node.js 18+

### Running Locally

1. Install dependencies:
   ```bash
   npm install
   ```

2. Start the server:
   ```bash
   npm start
   ```

3. Access the browser at `http://localhost:8080`.

## 📜 Credits

- **Aurora Browser**: Developed by Firewall Freedom by Sirco.
- **Scramjet**: The underlying proxy technology powering the browsing experience.
