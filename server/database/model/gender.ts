import { pgTable, serial, varchar } from 'drizzle-orm/pg-core'

export const gender = pgTable('gender', {
  id: serial('id').notNull().primaryKey(),
  label: varchar('label').notNull(),
})
