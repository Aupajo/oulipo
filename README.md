# Oulipo

_String and dance._

Oulipo gives you tools to write constrained stories and poems with Ruby.

It's still young, and very much liable to change.

The real [Oulipo](http://en.wikipedia.org/wiki/Oulipo) is a gathering of writers and mathmeticians who seek to create works using constrained writing techniques.

Install with `gem install oulipo` and `require 'oulipo'` as needed.

## Lipograms and Pangrams

Oulipo can detect lipograms and pangrams.

A lipogram willfully shuns one or more letters of the alphabet.

In the following snippet of a poem, every letter of the alphabet except 'e' is used:

```ruby
stanza = <<-GYLES_BRANDRETH

  Not work of man, nor sport of child
  Finds Nassan on this mazy wild;
  Lax grow his joints, limbs toil in vain--
  Poor wight! why didst thou quit that plain?

GYLES_BRANDRETH

Oulipo.lipogram?(stanza)      # => true
Oulipo.absent_letters(stanza) # => ['e']
```

In contrast, a pangram uses all the letters of the alphabet (often seen jumping lazy dogs):

```ruby
sentence = 'Big fjords vex quick waltz nymph.'

Oulipo.pangram?(sentence) # => true
```

## Univocalims

A univocalism is a poem written using only one type of vowel.

```ruby
poem = <<-POEM

  No cool monsoons blow soft on Oxford dons,
  Orthodox, jog-trot, book-worm Solomons
  
POEM

Oulipo.univocalism?(poem) # => true
```

## Palindromes

Palindromes read the same way, backwards or forwards:

```ruby
Oulipo.palindrome?('Eva, can I stab bats in a cave?') # => true
```

## Chaterisms

A chaterism is a poem where either each successive word in the poem grows by one letter (also known as "snowball poem") or shrinks by one letter.

```ruby
Oulipo.chaterism? 'Ruby loves poetry!'      # => true
Oulipo.chaterism? 'Poetry loves Ruby, too.' # => true

poem = <<-WORDS  

  One
  poem
  grows,
  author
  watches,
  helpless --
  syllables
  accumulate.

WORDS

Oulipo.snowball?(poem) # => true
```

## Alliteration

Oulipo can tell you about alliterations.

```ruby
Oulipo.alliteration? 'ravenous Ruby relishes radical raconteurs'  # => true
```

Normal alliteration's a little harsh, so you can give it a threshold, too.

```ruby
phrase = 'quick queens quibble over quails'

Oulipo.alliterativity(phrase) # => 0.8 (4/5 words start with 'q')
Oulipo.alliteration?(phrase, :threshold => 0.7) # => true 
Oulipo.alliteration?(phrase, :threshold => 0.9) # => false
```

## N+7

In N+7 (sometimes known as S+7), each noun in a text is replaced with the noun seven entries after it in a dictionary.

```ruby
dictionary = Oulipo::WordList.load('big_list_of_nouns.txt')

play = <<-SHAKESPEARE

  What, jealous Oberon! Fairies, skip hence:
  I have forsworn his bed and company.
  
SHAKESPEARE

Oulipo.n_plus(7, play, dictionary)  # => "What, jealous Oberon! Fallacies, skulk hence:
                                    #     I have forsworn his bedroom and compensation."
 
```

Oulipo includes a handy `WordList` class for reading one-word-per-line dictionary files, but a dictionary can be any object that responds to `index(word)`, `length`, and `[index]`.

```ruby
dictionary = %w{ iron gild mine gold ore paint cast lily }

king_john = 'To gild refined gold, to paint the lily'

Oulipo.n_plus(1, king_john, dictionary) # => 'To mine refined ore, to cast the iron'
```

## Extending String

You can optionally extend `String`, if you need to.

```ruby
require 'oulipo/string_em_up'

"Sator arepo tenet opera rotas".palindrome? # => true
"Waltz, bad nymph, for quick jigs vex!".pangram? # => true
'To gild refined gold'.n_plus(7, nouns) # ... as above
```

If you'd like to use the neat short-hand, but don't want to touch `String`, you might want to use an `EnhancedString`.

```ruby
palindrome = Oulipo::EnhancedString.new("Sator arepo tenet opera rotas")
palindrome.lipogram? # => true
```

## Analysis

Rudimentary analysis can be performed by using Oulipo's `Analysis` class.

```ruby
line = 'A rose by any other name would smell as sweet'

word_sets = {
  :nouns => %w{ bear name rose },
  :adjectives => %w{ sweet }
}

analysis = Oulipo::Analysis.new(line, word_sets)

analysis.identified(:nouns)      # => ['rose', 'name']
analysis.identified(:adjectives) # => ['sweet']

analysis.deconstruction # => ["A ", ["rose", :nouns], " by any other ", ["name", :nouns], " would smell as ", ["sweet", :adjectives]]
```

## Substitution

Substitution can be performed on an analysis.

Carrying on from the example above:

```ruby
substitutor = Oulipo::Substitutor.new(analysis)
substitutor.replace(:nouns).increment(1) # => "A bear by any other rose would smell as sweet"
```

---

Pete Nicholls ([@Aupajo](http://twitter.com/Aupajo))
