# FinePrint

FinePrint is a browser extension and web application that helps users understand and manage their digital privacy. It provides insights into data sharing practices and helps users make informed decisions about their online privacy.

## Overview

FinePrint consists of three main components:
- A browser extension for real-time privacy monitoring
- A web dashboard for privacy insights and management
- A backend service for data processing and analysis

## Features

- Privacy policy analysis and summarization
- Real-time tracking of data sharing
- Personalized privacy recommendations
- Data deletion request automation
- Privacy score visualization

## Development Setup

### Requirements
- Node.js
- PostgreSQL
- Chrome/Firefox browser

### Installation

1. Clone the repository:
```bash
git clone https://github.com/S-Slavin/FinePrint.git
cd FinePrint
```

2. Install dependencies:
```bash
# Frontend
cd frontend
npm install

# Backend
cd ../backend
npm install

# Extension
cd ../extension
npm install
```

3. Set up environment variables:
```bash
# Backend (.env)
DATABASE_URL=your_database_url
JWT_SECRET=your_jwt_secret
API_KEY=your_api_key

# Frontend (.env)
REACT_APP_API_URL=your_api_url
REACT_APP_EXTENSION_ID=your_extension_id
```

4. Start the development servers:
```bash
# Backend
cd backend
npm run dev

# Frontend
cd frontend
npm start

# Extension
cd extension
npm run dev
```

## Project Structure

```
FinePrint/
├── frontend/          # React web application
├── backend/           # Node.js/Express API
└── extension/         # Browser extension
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please reach out to:
- Email: shaina.slavin@gmail.com
- GitHub: [github.com/S-Slavin](https://github.com/S-Slavin) 