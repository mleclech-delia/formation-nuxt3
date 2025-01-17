const { queryClient } = useDrizzleQuery()
const logger = useLogger('films-service')

export async function getGenders() {
  logger.info('Getting genders from database')
  return queryClient.query.gender.findMany({
    orderBy: (gender, { asc }) => asc(gender.label),
  })
}
