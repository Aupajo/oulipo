# Oulipo

_String and dance._

[Oulipo](http://en.wikipedia.org/wiki/Oulipo) is a gathering of writers and mathmeticians who seek to create works using constrained writing techniques.


## Lipograms and Pangrams

Oulipo can detect lipograms and pangrams.

A lipogram willfully shuns one or more letters of the alphabet.

In the following snippet of a poem, every letter of the alphabet except 'e' is used:

  stanza = <<-GYLES_BRANDRETH
  
    Not work of man, nor sport of child
    Finds Nassan on this mazy wild;
    Lax grow his joints, limbs toil in vain--
    Poor wight! why didst thou quit that plain?
  
  GYLES_BRANDRETH
  
  Oulipo.lipogram?(stanza)      # => true
  Oulipo.absent_letters(stanza) # => ['e']


In contrast, a pangram uses all the letters of the alphabet (often seen jumping lazy dogs):

  sentence = 'Big fjords vex quick waltz nymph.'
  
  Oulipo.pangram?(sentence) # => true

## Univocalims

A univocalism is a poem written using only one type of vowel.

  poem = <<-POEM
    No cool monsoons blow soft on Oxford dons,
    Orthodox, jog-trot, book-worm Solomons
  POEM

  Oulipo.univocalism?(poem) # => true

## Chaterisms

Oulipo knows about Chaterisms.

A chaterism is a poem where either each successive word in the poem grows by one letter (also known as "snowball poem") or shrinks by one letter.

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
  
  Oulipo.snowball? poem # => true
