enum Language { Arabic, English }
enum Categories {Comics , Recipes, Novels,Biographies,Action}

class Book {
  final String imageUrl;
  final String book_name;
  final String auhton_name;
  final String description;
  final double rating;
  final int pages_number;
  final Language language;
  final double price;

  Book(
      {required this.imageUrl,
      required this.book_name,
      required this.auhton_name,
      required this.description,
      required this.rating,
      required this.pages_number,
      required this.language,
      required this.price});
}

List<Book> books = [
  Book(
      book_name: 'We Cast a Shadow',
      auhton_name: 'Maurice Carlos',
      description:
          'You can be beautiful, even more beautiful than before.\" This is the seductive promise of Dr. Nzinga\'s clinic, where anyone can get their lips thinned, their skin bleached, and their nose narrowed. A complete demelanization will liberate you from the confines of being born in a black body--if you can afford it.',
      language: Language.English,
      rating: 4.2,
      price: 17,
      pages_number: 352,
      imageUrl: 'assets/images/book_covers/we_cast_a_shadow.jpg'),
  Book(
      imageUrl: 'assets/images/book_covers/jim_crow.jpg',
      book_name:
          'Jim Crow',
      auhton_name: 'Jim Crow',
      description:
          'Seldom does a book have the impact of Michelle Alexander\'s The New Jim Crow. Since it was first published in 2010, it has been cited in judicial decisions and has been adopted in campus-wide and community-wide reads; it helped inspire the creation of the Marshall Project and the new \$100 million Art for Justice Fund; it has been the winner of numerous prizes, including the prestigious NAACP Image Award; and it has spent nearly 250 weeks on the New York Times bestseller list.',
      rating: 5,
      pages_number: 352,
      language: Language.English,
      price: 19),
  Book(
      imageUrl: 'assets/images/book_covers/convenience_Store_woman.jpg',
      book_name: 'Store Woman',
      auhton_name: 'Sayaka Murata',
      description:
          'A brilliant depiction of an unusual psyche and a world hidden from view, Convenience Store Woman is an ironic and sharp-eyed look at contemporary work culture and the pressures to conform, as well as a charming and completely fresh portrait of an unforgettable heroine.',
      rating: 4.5,
      pages_number: 176,
      language: Language.English,
      price: 14.72),
  Book(
      imageUrl: 'assets/images/book_covers/recursion.jpg',
      book_name: 'Recursion',
      auhton_name: 'Blake Crouch',
      description:
          'Reality is broken. At first, it looks like a disease. An epidemic that spreads through no known means, driving its victims mad with memories of a life they never lived. But the force that\'s sweeping the world is no pathogen. It\'s just the first shock wave, unleashed by a stunning discovery--and what\'s in jeopardy is not our minds but the very fabric of time itself.',
      rating: 4.8,
      pages_number: 336,
      language: Language.English,
      price: 25),
  Book(
      imageUrl: 'assets/images/book_covers/harvard_square.jpg',
      book_name: 'Harvard Square',
      auhton_name: 'André Aciman',
      description:
          'Harvard Square is the elegant and sexually charged story of a young émigré grad student, a Jew from Egypt, who meets a brash, magnetic Arab taxi driver--and how their friendship tests his loyalties and throws his life in America into doubt. André Aciman\'s writing has been hailed by Colm Tóibín as fiction at its most supremely interesting, and here Aciman delivers a powerful tale of identity and the wages of assimilation.',
      rating: 3.8,
      pages_number: 292,
      language: Language.English,
      price: 9),
];
