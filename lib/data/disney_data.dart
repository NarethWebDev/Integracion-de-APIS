import '../models/movie_model.dart';

class DisneyData {
  // LISTA AUMENTADA (Manteniendo compatibilidad con tus filtros)
  static final List<DisneyContent> allContent = [
    DisneyContent(
      id: '1',
      title: 'Frozen II',
      year: '2019',
      poster: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNbm28EZhooHofMhqRbjqYXm58jMZo87-n1A&s',
      backdrop: 'https://los40.com/resizer/v2/GMVVEZP26VMD5JQXDYU3JL5MZQ.jpg?auth=4a012cab3376474029128855b4473d2a5d3044d1f2774325ab9bb4c864b45032&quality=70&width=1200&height=675&smart=true',
      type: 'movie',
      description: 'Elsa, Anna, Kristoff, Olaf y Sven viajan más allá de Arendelle.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.2,
      director: 'Chris Buck',
    ),
    DisneyContent(
      id: '2',
      title: 'Loki',
      year: '2021',
      poster: 'https://m.media-amazon.com/images/M/MV5BZDU0MTQ0YWQtMmM0Yy00Y2FmLWI5OTktZWM1ODg5MGY4OTQ4XkEyXkFqcGc@._V1_QL75_UY281_CR18,0,190,281_.jpg',
      backdrop: 'https://elcomercio.pe/resizer/9OnRhxx4dQGj6Zur66blLwxVXT0=/950x475/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/GTDHYTCHYFABRMDIY4PYKTU3UY.jpg',
      type: 'series',
      description: 'El Dios del Engaño sale de la sombra de su hermano.',
      genres: ['Acción', 'Aventura', 'Fantasía'],
      rating: 8.2,
      director: 'Kate Herron',
    ),
    DisneyContent(
      id: '3',
      title: 'Encanto',
      year: '2021',
      poster: 'https://image.tmdb.org/t/p/w500/6zHLcVPV78VVLZ5A3Xq7MUCVyqw.jphttps://lumiere-a.akamaihd.net/v1/images/encanto_ka_las_pay1_92ad7410.jpeg',
      backdrop: 'https://www.infobae.com/resizer/v2/TGR7MGNDXBHG3BOOTPWKEY6WRA.png?auth=2f23fc348ab5ef1e08d34e19739e45f64b3d732b95464375009d7b6d2ec896fa&smart=true&width=1024&height=512&quality=85',
      type: 'movie',
      description: 'La historia de los Madrigal, una familia extraordinaria.',
      genres: ['Animación', 'Familia', 'Musical'],
      rating: 7.7,
      director: 'Byron Howard',
    ),
    DisneyContent(
      id: '4',
      title: 'The Mandalorian',
      year: '2019',
      poster: 'https://www.lucasfilm.com/app/uploads/poster-mando-480x733.jpg',
      backdrop: 'https://es.web.img3.acsta.net/img/59/bf/59bff45fab2998c2d26f1302847ea8af.jpg',
      type: 'series',
      description: 'Un pistolero solitario en los confines de la galaxia.',
      genres: ['Acción', 'Ciencia Ficción'],
      rating: 8.7,
      director: 'Jon Favreau',
    ),
    // Ejemplo de un elemento dentro de allContent
    DisneyContent(
      id: '5',
      title: 'Moana ',
      year: '2024',
      poster: 'https://lumiere-a.akamaihd.net/v1/images/p_moana_20530_214883e3.jpeg?region=0%2C0%2C540%2C810', // Imagen vertical
      backdrop: 'https://ichef.bbci.co.uk/images/ic/480xn/p04j6nxk.jpg.webp', // Imagen horizontal para el fondo
      type: 'movie',
      description: 'Moana recibe un inesperado aviso de sus ancestros.',
      genres: ['Animación', 'Aventura'],
      rating: 8.3,
      director: 'David G. Derrick Jr.',
    ),
    DisneyContent(
      id: '6',
      title: 'Avatar: El Sentido del Agua',
      year: '2022',
      poster: 'https://http2.mlstatic.com/D_NQ_NP_820377-MLU70799697688_082023-O.webp',
      backdrop: 'https://media.gqmagazine.fr/photos/63dce1f582e384fe4d7ac7ef/master/pass/raw.jpeg',
      type: 'movie',
      description: 'Jake Sully y Ney\'tiri han formado una familia en Pandora.',
      genres: ['Acción', 'Aventura', 'Ciencia Ficción'],
      rating: 7.6,
      director: 'James Cameron',
    ),
    DisneyContent(
      id: '7',
      title: 'Deadpool & Wolverine',
      year: '2024',
      poster: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNYOexsRNcZp1Fr-ZGwBoUxOg6-29ALKpJmA&s',
      backdrop: 'https://lumiere-a.akamaihd.net/v1/images/mobile_89eef737.jpeg?region=0,0,1239,1001',
      type: 'movie',
      description: 'Una misión que cambiará la historia del Universo Cinematográfico de Marvel.',
      genres: ['Acción', 'Comedia', 'Ciencia Ficción'],
      rating: 8.1,
      director: 'Shawn Levy',
    ),
    DisneyContent(
      id: '8',
      title: 'WandaVision',
      year: '2021',
      poster: 'https://cdn.marvel.com/content/1x/online.jpg',
      backdrop: 'https://media.gq.com.mx/photos/5ffa01f49274cd36fe35680f/16:9/w_2560%2Cc_limit/WandaVision-disney.jpg',
      type: 'series',
      description: 'Wanda Maximoff y Visión viven una vida suburbana ideal.',
      genres: ['Drama', 'Misterio', 'Ciencia Ficción'],
      rating: 7.9,
      director: 'Matt Shakman',
    ),
    DisneyContent(
      id: '9',
      title: 'Elementos',
      year: '2023',
      poster: 'https://purodiseno.lat/wp-content/uploads/2023/09/ELEMENTOS-POSTER-.jpg',
      backdrop: 'https://cadenaser.com/resizer/v2/6DOR626ASZGEDLHFVDOTP2EJT4.jpg?auth=fe54a80cc9512727e7d748ecf2217b5192cd875aef342b1b24f0b1ad4d902932',
      type: 'movie',
      description: 'En una ciudad donde los elementos de fuego, agua, tierra y aire conviven.',
      genres: ['Animación', 'Familia', 'Comedia'],
      rating: 7.7,
      director: 'Peter Sohn',
    ),
    DisneyContent(
      id: '10',
      title: 'Ahsoka',
      year: '2023',
      poster: 'https://es.web.img2.acsta.net/pictures/23/09/19/11/27/3320024.jpg', // URL ejemplo
      backdrop: 'https://estaticos.elcolombiano.com/binrepository/850x566/70c0/780d565/none/11101/IQRS/stc-003276-r_43109394_20230822190311.jpg',
      type: 'series',
      description: 'Ahsoka Tano investiga una amenaza emergente para la galaxia.',
      genres: ['Acción', 'Aventura', 'Ciencia Ficción'],
      rating: 7.8,
      director: 'Dave Filoni',
    ),
  ];

  // MANTENEMOS TUS FILTROS ORIGINALES
  static final List<ContentFilter> filters = [
    ContentFilter(name: 'Todo', value: 'all'),
    ContentFilter(name: 'Películas', value: 'movie'),
    ContentFilter(name: 'Series', value: 'series'),
    ContentFilter(name: 'Animación', value: 'Animación'),
    ContentFilter(name: 'Aventura', value: 'Aventura'),
    ContentFilter(name: 'Familia', value: 'Familia'),
  ];

  // FUNCIONES DE LÓGICA (Sin cambios, solo devuelven los datos aumentados)
  static List<DisneyContent> getFeatured() => allContent.take(5).toList();
  static List<DisneyContent> getComingSoon() => allContent.skip(5).toList();

  static List<DisneyContent> getContentByType(String type) {
    if (type == 'all') return allContent;
    return allContent.where((c) => c.type == type).toList();
  }

  static List<DisneyContent> getContentByGenre(String genre) {
    if (genre == 'all') return allContent;
    return allContent.where((c) => c.genres.contains(genre)).toList();
  }

  static List<DisneyContent> searchContent(String query) {
    if (query.isEmpty) return allContent;
    return allContent.where((c) => c.title.toLowerCase().contains(query.toLowerCase())).toList();
  }
}