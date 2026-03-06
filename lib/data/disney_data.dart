import '../models/movie_model.dart';

class DisneyData {
  // ============================================================
  // ============================================================
  static final List<DisneyContent> allContent = [
    // --- TUS PELÍCULAS ORIGINALES ---
    DisneyContent(
      id: '1',
      title: 'Frozen II',
      year: '2019',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNbm28EZhooHofMhqRbjqYXm58jMZo87-n1A&s',
      backdrop:
          'https://los40.com/resizer/v2/GMVVEZP26VMD5JQXDYU3JL5MZQ.jpg?auth=4a012cab3376474029128855b4473d2a5d3044d1f2774325ab9bb4c864b45032&quality=70&width=1200&height=675&smart=true',
      type: 'movie',
      description:
          'Elsa, Anna, Kristoff, Olaf y Sven viajan más allá de Arendelle.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.2,
      director: 'Chris Buck',
    ),
    DisneyContent(
      id: '3',
      title: 'Encanto',
      year: '2021',
      poster:
          'https://lumiere-a.akamaihd.net/v1/images/encanto_ka_las_pay1_92ad7410.jpeg',
      backdrop:
          'https://www.infobae.com/resizer/v2/TGR7MGNDXBHG3BOOTPWKEY6WRA.png?auth=2f23fc348ab5ef1e08d34e19739e45f64b3d732b95464375009d7b6d2ec896fa&smart=true&width=1024&height=512&quality=85',
      type: 'movie',
      description: 'La historia de los Madrigal, una familia extraordinaria.',
      genres: ['Animación', 'Familia', 'Musical'],
      rating: 7.7,
      director: 'Byron Howard',
    ),
    DisneyContent(
      id: '4',
      title: 'Moana 2',
      year: '2024',
      poster:
          'https://lumiere-a.akamaihd.net/v1/images/p_moana_20530_214883e3.jpeg?region=0%2C0%2C540%2C810',
      backdrop: 'https://ichef.bbci.co.uk/images/ic/480xn/p04j6nxk.jpg.webp',
      type: 'movie',
      description: 'Moana recibe un inesperado aviso de sus ancestros.',
      genres: ['Animación', 'Aventura'],
      rating: 8.3,
      director: 'David G. Derrick Jr.',
    ),
    DisneyContent(
      id: '5',
      title: 'Avatar: El Sentido del Agua',
      year: '2022',
      poster:
          'https://http2.mlstatic.com/D_NQ_NP_820377-MLU70799697688_082023-O.webp',
      backdrop:
          'https://media.gqmagazine.fr/photos/63dce1f582e384fe4d7ac7ef/master/pass/raw.jpeg',
      type: 'movie',
      description: 'Jake Sully y Ney\'tiri han formado una familia en Pandora.',
      genres: ['Acción', 'Aventura', 'Ciencia Ficción'],
      rating: 7.6,
      director: 'James Cameron',
    ),
    DisneyContent(
      id: '6',
      title: 'Deadpool & Wolverine',
      year: '2024',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNYOexsRNcZp1Fr-ZGwBoUxOg6-29ALKpJmA&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/mobile_89eef737.jpeg?region=0,0,1239,1001',
      type: 'movie',
      description:
          'Una misión que cambiará la historia del Universo Cinematográfico de Marvel.',
      genres: ['Acción', 'Comedia', 'Ciencia Ficción'],
      rating: 8.1,
      director: 'Shawn Levy',
    ),
    DisneyContent(
      id: '7',
      title: 'Elementos',
      year: '2023',
      poster:
          'https://purodiseno.lat/wp-content/uploads/2023/09/ELEMENTOS-POSTER-.jpg',
      backdrop:
          'https://cadenaser.com/resizer/v2/6DOR626ASZGEDLHFVDOTP2EJT4.jpg?auth=fe54a80cc9512727e7d748ecf2217b5192cd875aef342b1b24f0b1ad4d902932',
      type: 'movie',
      description: 'En una ciudad donde los elementos conviven.',
      genres: ['Animación', 'Familia', 'Comedia'],
      rating: 7.7,
      director: 'Peter Sohn',
    ),
    DisneyContent(
      id: '10',
      title: 'Toy Story 4',
      year: '2019',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwDIjEoDK0n7sWZHGWJlrLqfq8v6OqWX_Wig&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/toy-story-4-background_ab0c7920.jpeg',
      type: 'movie',
      description:
          'Woody y su pandilla emprenden una nueva aventura cuando Bonnie entra a la escuela.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.8,
      director: 'Josh Cooley',
    ),
    DisneyContent(
      id: '11',
      title: 'Coco',
      year: '2017',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL_k7lXNJ5J5B5B5B5B5B5B5B5B5B5B5B5B5B&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/coco-background_3ab6c8d5.jpeg',
      type: 'movie',
      description:
          'Miguel persigue su pasión por la música en el colorido mundo de Coco.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 8.4,
      director: 'Lee Unkrich',
    ),
    DisneyContent(
      id: '12',
      title: 'Aladdin',
      year: '2019',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0lZ1X1X1X1X1X1X1X1X1X1X1X1X1X1X1X1X&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/aladdin-background_c9b9c9d9.jpeg',
      type: 'movie',
      description:
          'Un joven ladrón descubre un poder mágico y se enamora de una princesa.',
      genres: ['Aventura', 'Acción', 'Familia'],
      rating: 7.0,
      director: 'Guy Ritchie',
    ),
    DisneyContent(
      id: '13',
      title: 'La Reina de las Nieves',
      year: '2013',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_T_T_T_T_T_T_T_T_T_T_T_T_T_T_T_T_T&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/frozen-background_a9a8c8d8.jpeg',
      type: 'movie',
      description:
          'La primera aventura de Elsa, Anna y Olaf en un reino helado.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.4,
      director: 'Chris Buck',
    ),
    DisneyContent(
      id: '14',
      title: 'Raya y el Último Dragón',
      year: '2021',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcX_X_X_X_X_X_X_X_X_X_X_X_X_X_X_X_X_X&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/raya-background_b9b8c8d8.jpeg',
      type: 'movie',
      description: 'Raya busca el último dragón para salvar su mundo.',
      genres: ['Animación', 'Aventura', 'Acción'],
      rating: 7.8,
      director: 'Don Hall',
    ),
    DisneyContent(
      id: '15',
      title: 'Mundo de Pixar',
      year: '2020',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcY_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/pixar-background_c9c8c8d8.jpeg',
      type: 'movie',
      description:
          'Un alma viaja a través de mundos extraordinarios descubriendo su propósito.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 8.2,
      director: 'Pete Docter',
    ),
    DisneyContent(
      id: '16',
      title: 'Hercules',
      year: '1997',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcZ_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/hercules-background_d9d8d8d8.jpeg',
      type: 'movie',
      description:
          'Hércules descubre su verdadero origen y se convierte en un héroe.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.5,
      director: 'Ron Clements',
    ),
    DisneyContent(
      id: '17',
      title: 'La Bella y la Bestia',
      year: '1991',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcA_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/beauty-background_e9e8e8d8.jpeg',
      type: 'movie',
      description: 'Bella se enamora de la Bestia en su castillo encantado.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.4,
      director: 'Gary Trousdale',
    ),

    // --- NUEVAS 15 SERIES (Diferentes a películas) ---
    DisneyContent(
      id: 's1',
      title: 'Loki',
      year: '2021',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtNzg3Yy00Y2VlLTg1MzgtYzY3ZmY5NzEwOTFlXkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_.jpg',
      backdrop: 'https://wallpapercave.com/wp/wp9215031.jpg',
      type: 'series',
      description: 'El Dios del Engaño sale de la sombra de su hermano.',
      genres: ['Acción', 'Aventura', 'Fantasía'],
      rating: 8.2,
      director: 'Kate Herron',
    ),
    DisneyContent(
      id: 's2',
      title: 'The Mandalorian',
      year: '2019',
      poster:
          'https://m.media-amazon.com/images/M/MV5BN2M5YWFjN2ItNmVlYS00MDVmLTkxMTYtN2I3NzYxM2I2YmE5XkEyXkFqcGdeQXVyNDIyNjA2MTk@._V1_.jpg',
      backdrop: 'https://images2.alphacoders.com/105/1051510.jpg',
      type: 'series',
      description: 'Un pistolero solitario en los confines de la galaxia.',
      genres: ['Acción', 'Ciencia Ficción'],
      rating: 8.7,
      director: 'Jon Favreau',
    ),
    DisneyContent(
      id: 's3',
      title: 'WandaVision',
      year: '2021',
      poster:
          'https://m.media-amazon.com/images/M/MV5BYjJiZjMzYzktNjE0Mi00OTkxLWE1YzEtNjgxMDc5NjFiMzY4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
      backdrop:
          'https://media.gq.com.mx/photos/5ffa01f49274cd36fe35680f/16:9/w_2560%2Cc_limit/WandaVision-disney.jpg',
      type: 'series',
      description: 'Wanda y Visión viven una vida suburbana ideal.',
      genres: ['Drama', 'Misterio', 'Ciencia Ficción'],
      rating: 7.9,
      director: 'Matt Shakman',
    ),
    DisneyContent(
      id: 's4',
      title: 'Ahsoka',
      year: '2023',
      poster:
          'https://es.web.img2.acsta.net/pictures/23/09/19/11/27/3320024.jpg',
      backdrop:
          'https://estaticos.elcolombiano.com/binrepository/850x566/70c0/780d565/none/11101/IQRS/stc-003276-r_43109394_20230822190311.jpg',
      type: 'series',
      description: 'Ahsoka Tano investiga una amenaza emergente.',
      genres: ['Acción', 'Aventura', 'Ciencia Ficción'],
      rating: 7.8,
      director: 'Dave Filoni',
    ),
    DisneyContent(
      id: 's5',
      title: 'Moon Knight',
      year: '2022',
      poster:
          'https://m.media-amazon.com/images/M/MV5BYTc5OWNhYjktMThlOS00ODUxLTgwNDQtZWFmYmY1MWRhZGU1XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
      backdrop:
          'https://images.squarespace-cdn.com/content/v1/5c33ca6385ede10d60f58d92/1647970104764-7D6N17K1W58I6H6Z6W6G/Moon+Knight.jpg',
      type: 'series',
      description: 'Un empleado de una tienda padece trastorno de identidad.',
      genres: ['Acción', 'Aventura', 'Fantasía'],
      rating: 7.3,
      director: 'Mohamed Diab',
    ),
    DisneyContent(
      id: 's6',
      title: 'Bluey',
      year: '2018',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNmU5YTNhYzgtY2JmNC00YjViLWFhMmQtNmY0NWM1YmRkMWY1XkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_.jpg',
      backdrop:
          'https://images.static-bluray.com/products/22/10777_1_large.jpg',
      type: 'series',
      description: 'Una perrita de seis años vive con su familia.',
      genres: ['Animación', 'Familia', 'Comedia'],
      rating: 9.4,
      director: 'Joe Brumm',
    ),
    DisneyContent(
      id: 's7',
      title: 'Andor',
      year: '2022',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNDM4M2EwOTYtYmUyYS00YjVlLTgwMzUtYzA2MmI0YmZlOTVjXkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_.jpg',
      backdrop: 'https://images3.alphacoders.com/125/1254823.jpg',
      type: 'series',
      description: 'Explora una nueva perspectiva de la galaxia de Star Wars.',
      genres: ['Acción', 'Aventura', 'Drama'],
      rating: 8.4,
      director: 'Tony Gilroy',
    ),
    DisneyContent(
      id: 's8',
      title: 'The Bear',
      year: '2022',
      poster:
          'https://m.media-amazon.com/images/M/MV5BZjE3YjVlYTMtYmI3MS00N2I5LWE2NWYtZDU1Y2U2YmJiNzllXkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_.jpg',
      backdrop: 'https://wallpaperaccess.com/full/10892404.jpg',
      type: 'series',
      description:
          'Un joven chef regresa a Chicago para dirigir la tienda de su familia.',
      genres: ['Drama', 'Comedia'],
      rating: 8.6,
      director: 'Christopher Storer',
    ),
    DisneyContent(
      id: 's9',
      title: 'Shogun',
      year: '2024',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtNzg3Yy00Y2VlLTg1MzgtYzY3ZmY5NzEwOTFlXkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_.jpg',
      backdrop: 'https://wallpapercave.com/wp/wp13623348.jpg',
      type: 'series',
      description: 'En el Japón de 1600, Lord Toranaga lucha por su vida.',
      genres: ['Drama', 'Historia', 'Aventura'],
      rating: 8.8,
      director: 'Rachel Kondo',
    ),
    DisneyContent(
      id: 's10',
      title: 'The Simpsons',
      year: '1989',
      poster:
          'https://m.media-amazon.com/images/M/MV5BYjJiZjMzYzktNjE0Mi00OTkxLWE1YzEtNjgxMDc5NjFiMzY4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
      backdrop: 'https://wallpaperaccess.com/full/431872.jpg',
      type: 'series',
      description:
          'Las aventuras satíricas de una familia de clase trabajadora.',
      genres: ['Animación', 'Comedia'],
      rating: 8.7,
      director: 'Matt Groening',
    ),
    DisneyContent(
      id: 's11',
      title: 'Monsters at Work',
      year: '2021',
      poster:
          'https://m.media-amazon.com/images/M/MV5BMGRlNTY3YmYtNmY5MS00Y2NhLWEzMWItY2NlNWZkZGEwYjU4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
      backdrop:
          'https://images.squarespace-cdn.com/content/v1/5c33ca6385ede10d60f58d92/1625686000.jpg',
      type: 'series',
      description: 'Tylor Tuskmon llega a Monsters, Inc. para ser asustador.',
      genres: ['Animación', 'Comedia', 'Familia'],
      rating: 7.0,
      director: 'Roberts Gannaway',
    ),
    DisneyContent(
      id: 's12',
      title: 'Only Murders in the Building',
      year: '2021',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNjRjOTI1YjctYmJlYi00ZmY0LThjMGQtYTgwYjllY2NlY2FhXkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_.jpg',
      backdrop: 'https://images.tntdrama.com/tnt/murders_backdrop.jpg',
      type: 'series',
      description:
          'Tres desconocidos comparten una obsesión por el crimen real.',
      genres: ['Comedia', 'Crimen', 'Misterio'],
      rating: 8.1,
      director: 'Steve Martin',
    ),
    DisneyContent(
      id: 's13',
      title: 'Percy Jackson',
      year: '2023',
      poster:
          'https://m.media-amazon.com/images/M/MV5BMjA1NmRjMzEtM2ExOS00NGQyLWIxMTgtMWGzZDI0YTMzYjY2XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg',
      backdrop: 'https://images2.alphacoders.com/133/1334584.jpg',
      type: 'series',
      description:
          'Percy Jackson lidera una misión para evitar una guerra divina.',
      genres: ['Acción', 'Aventura', 'Fantasía'],
      rating: 7.1,
      director: 'Rick Riordan',
    ),
    DisneyContent(
      id: 's14',
      title: 'Daredevil',
      year: '2015',
      poster:
          'https://m.media-amazon.com/images/M/MV5BODcwOTg2MDE3NF5BMl5BanBnXkFtZTgwNTUyMzE1NDM@._V1_.jpg',
      backdrop: 'https://wallpaperaccess.com/full/1125206.jpg',
      type: 'series',
      description:
          'Matt Murdock lucha contra la injusticia como abogado y héroe.',
      genres: ['Acción', 'Crimen', 'Drama'],
      rating: 8.6,
      director: 'Drew Goddard',
    ),
    DisneyContent(
      id: 's15',
      title: 'Grey\'s Anatomy',
      year: '2005',
      poster:
          'https://m.media-amazon.com/images/M/MV5BMjA1NmRjMzEtM2ExOS00NGQyLWIxMTgtMWGzZDI0YTMzYjY2XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg',
      backdrop: 'https://wallpaperaccess.com/full/1567676.jpg',
      type: 'series',
      description:
          'Un drama centrado en la vida personal de internos de cirugía.',
      genres: ['Drama', 'Romance'],
      rating: 7.6,
      director: 'Shonda Rhimes',
    ),
  ];

  // ============================================================
  // 2. LISTA DE 15 PERSONAJES
  // ============================================================
  static final List<DisneyCharacter> allCharacters = [
    DisneyCharacter(
        id: 'c1',
        name: 'Mickey Mouse',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz-M35zBf-f8wK2W5T34Y04Nf5Y9A_fBv7Sg&s',
        movieTitle: 'Clásicos Disney'),
    DisneyCharacter(
        id: 'c2',
        name: 'Elsa',
        imageUrl:
            'https://static.wikia.nocookie.net/disney/images/e/ee/Elsa_Frozen_2.png',
        movieTitle: 'Frozen'),
    DisneyCharacter(
        id: 'c3',
        name: 'Iron Man',
        imageUrl: 'https://cdn.marvel.com/content/1x/002irm_ons_crd_03.jpg',
        movieTitle: 'Marvel'),
    DisneyCharacter(
        id: 'c4',
        name: 'Darth Vader',
        imageUrl:
            'https://lumiere-a.akamaihd.net/v1/images/darth-vader-main_4560aff7.jpeg',
        movieTitle: 'Star Wars'),
    DisneyCharacter(
        id: 'c5',
        name: 'Simba',
        imageUrl:
            'https://static.wikia.nocookie.net/disney/images/e/ea/Simba_TLK_transparent.png',
        movieTitle: 'Rey León'),
    DisneyCharacter(
        id: 'c6',
        name: 'Spider-Man',
        imageUrl: 'https://cdn.marvel.com/content/1x/006hms_ons_crd_03.jpg',
        movieTitle: 'Marvel'),
    DisneyCharacter(
        id: 'c7',
        name: 'Moana',
        imageUrl:
            'https://lumiere-a.akamaihd.net/v1/images/p_moana_20530_214883e3.jpeg',
        movieTitle: 'Moana'),
    DisneyCharacter(
        id: 'c8',
        name: 'Buzz Lightyear',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6ZlU3T8HnOunx8O2y-YI4L6xP7X07xX5X5A&s',
        movieTitle: 'Toy Story'),
    DisneyCharacter(
        id: 'c9',
        name: 'Grogu',
        imageUrl:
            'https://lumiere-a.akamaihd.net/v1/images/the-child-main_1af3897b.jpeg',
        movieTitle: 'The Mandalorian'),
    DisneyCharacter(
        id: 'c10',
        name: 'Stitch',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfU6L2p2E9WnN3B3P9J3k2W_3J3k2W_3J3k2W&s',
        movieTitle: 'Lilo & Stitch'),
    DisneyCharacter(
        id: 'c11',
        name: 'Wanda Maximoff',
        imageUrl: 'https://cdn.marvel.com/content/1x/012wvm_ons_crd_02.jpg',
        movieTitle: 'Marvel'),
    DisneyCharacter(
        id: 'c12',
        name: 'Ahsoka Tano',
        imageUrl:
            'https://lumiere-a.akamaihd.net/v1/images/ahsoka-tano-main_0b4d4b14.jpeg',
        movieTitle: 'Star Wars'),
    DisneyCharacter(
        id: 'c13',
        name: 'Winnie the Pooh',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_S-Wb_B5552O_4S4p02wH4E-f8Vb9uF093w&s',
        movieTitle: 'Winnie the Pooh'),
    DisneyCharacter(
        id: 'c14',
        name: 'Cenicienta',
        imageUrl:
            'https://static.wikia.nocookie.net/disney/images/c/c2/Cinderella_Disney_Princess.png',
        movieTitle: 'Clásicos'),
    DisneyCharacter(
        id: 'c15',
        name: 'Hulk',
        imageUrl: 'https://cdn.marvel.com/content/1x/006hms_ons_crd_03.jpg',
        movieTitle: 'Marvel'),
  ];

  // ============================================================
  // 3. FILTROS Y LÓGICA
  // ============================================================
  static final List<ContentFilter> filters = [
    ContentFilter(name: 'Todo', value: 'all'),
    ContentFilter(name: 'Películas', value: 'movie'),
    ContentFilter(name: 'Series', value: 'series'),
    ContentFilter(name: 'Animación', value: 'Animación'),
    ContentFilter(name: 'Aventura', value: 'Aventura'),
    ContentFilter(name: 'Familia', value: 'Familia'),
  ];

  static List<DisneyContent> getFeatured() => allContent.take(15).toList();
  static List<DisneyContent> getComingSoon() => allContent.skip(15).toList();

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
    return allContent
        .where((c) => c.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
