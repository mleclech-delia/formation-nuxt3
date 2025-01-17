# Nuxt Minimal Starter

Look at the [Nuxt documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

## Setup

Run postgres instance before running project

```bash
# docker
docker run --name pg-formation-nuxt-3 -p 5432:5432 -e POSTGRES_PASSWORD=password -e POSTGRES_USER=delia -e POSTGRES_DB=formation-nuxt3 -d postgres
```

Make sure to install dependencies:

```bash
# npm
npm install

# pnpm
pnpm install

# yarn
yarn install

# bun
bun install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# npm
npm run dev

# pnpm
pnpm dev

# yarn
yarn dev

# bun
bun run dev
```

## Production

Build the application for production:

```bash
# npm
npm run build

# pnpm
pnpm build

# yarn
yarn build

# bun
bun run build
```

Locally preview production build:

```bash
# npm
npm run preview

# pnpm
pnpm preview

# yarn
yarn preview

# bun
bun run preview
```

Check out the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.

## Formation Nuxt3

Niveau Débutant / Intermédiaire

Temps: 1j

## Contenu

* Architecture des dossiers

* Nuxt CLI

* Page, component, layout

* Routing et middleware ( coté client )

* Route et serveur middleware ( coté serveur )

* Data Fetching

* State Management

* DevTools

### Si on a le temps

* Gestion des erreurs

* SSR

* Modules

## Pré-requis

### Environnement de dev

* Docker

* Editeur de texte maitrisé ( de préférence vscode )

* Node LTS

* Git

### Connaissances

* Javascript / Typescript

* Vue 3

* Git

## Format

* Partie théorie sous forme de slide

* Partie pratique avec un répertoire git pré-configuré
