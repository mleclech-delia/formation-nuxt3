import process from 'node:process'
import { defineConfig } from 'drizzle-kit'

export default defineConfig({
  schema: 'server/database/model',
  out: 'server/database/migrations',
  dialect: 'postgresql',
  dbCredentials: {
    url: process.env.NUXT_DATABASE_URL!,
    ssl: false,
  },
  migrations: {
    prefix: 'timestamp',
  },
})
