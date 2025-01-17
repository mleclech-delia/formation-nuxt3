import { migrate } from 'drizzle-orm/postgres-js/migrator'

const logger = useLogger('migration')

export default defineNitroPlugin(async () => {
  const { migrationClient, closeMigrationConnection } = useDrizzleMigration()

  try {
    const result = await migrate(migrationClient, { migrationsFolder: './server/database/migrations' })
    logger.debug('Migration result:', result)
  }
  catch (error) {
    logger.error('Migration error:', error)
  }
  finally {
    closeMigrationConnection()
  }
})
