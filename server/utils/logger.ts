import process from 'node:process'
import { createConsola } from 'consola/core'

export function useLogger(tagLogger: string) {
  if (process.env.NODE_ENV === 'development') {
    return createConsola({ level: 5 }).withTag(tagLogger) // Niveau "trace"
  }
  return createConsola({ level: 1 }).withTag(tagLogger)
}
