import { drizzle } from 'drizzle-orm/postgres-js'
import postgres from 'postgres'
import schema from '../database/model'

let queryClientPostgres: ReturnType<typeof initQueryClientPostgres>
let queryClient: ReturnType<typeof initQueryClient>
let migrationClientPostgres: ReturnType<typeof initMigrationClientPostgres>
let migrationClient: ReturnType<typeof initMigrationClient>

const logger = useLogger('drizzle')

export function useDrizzleMigration() {
  if (!migrationClientPostgres) {
    logger.warn('initClient migrationClientPostgres')
    migrationClientPostgres = initMigrationClientPostgres()
    migrationClient = initMigrationClient()
  }

  const closeMigrationConnection = async () => {
    logger.warn('Closing migration database connection')
    await migrationClientPostgres.end()
  }

  return {
    migrationClient,
    closeMigrationConnection,
  }
}

export function useDrizzleQuery() {
  if (!queryClientPostgres) {
    logger.warn('initClient queryClientPostgres')
    queryClientPostgres = initQueryClientPostgres()
    queryClient = initQueryClient()
  }

  const closeQueryConnection = async () => {
    logger.warn('Closing query database connection')
    await queryClientPostgres.end()
  }

  return {
    queryClient,
    closeQueryConnection,
  }
}

export function getDatabaseUri() {
  const runtimeConfig = useRuntimeConfig()
  return runtimeConfig.databaseUrl
}

function initQueryClientPostgres() {
  return postgres(getDatabaseUri())
}

function initMigrationClientPostgres() {
  const migrationClientPostgres = postgres(getDatabaseUri(), {
    max: 1,
  })
  return migrationClientPostgres
}

function initQueryClient() {
  return drizzle(queryClientPostgres, { schema })
}

function initMigrationClient() {
  return drizzle(migrationClientPostgres)
}
