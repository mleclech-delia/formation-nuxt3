const { queryClient } = useDrizzleQuery()
const logger = useLogger('films-service')

export async function getFilms() {
  logger.info('Getting films')
  return queryClient.query.films.findMany({
    orderBy: (film, { asc }) => asc(film.title),
  })
}
