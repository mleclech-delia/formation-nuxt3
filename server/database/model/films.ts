import { relations } from 'drizzle-orm'
import { integer, pgTable, serial, varchar } from 'drizzle-orm/pg-core'
import { gender } from './gender'

export const films = pgTable('films', {
  id: serial('id').notNull().primaryKey(),
  title: varchar('title').notNull(),
  publicationYear: integer('publication_year').notNull(),
  genderId: integer('genre_id').notNull().references(() => gender.id),
  synopsis: varchar('synopsis').notNull(),
  imageCover: varchar('image_cover').notNull(),
})

export const filmsRelations = relations(films, ({ one }) => ({
  gender: one(gender, {
    fields: [films.genderId],
    references: [gender.id],
  }),
}))
