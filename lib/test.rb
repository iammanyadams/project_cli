# frozen_string_literal: true

#require_relative "../lib/tty-prompt"
require 'tty-prompt'

prompt = TTY::Prompt.new

query_parameters = [



Query parameters
ml	Means like constraint: require that the results have a meaning related to this string value, which can be any word or sequence of words. (This is effectively the reverse dictionary feature of OneLook.)
sl	Sounds like constraint: require that the results are pronounced similarly to this string of characters. (If the string of characters doesn't have a known pronunciation, the system will make its best guess using a text-to-phonemes algorithm.)
sp	Spelled like constraint: require that the results are spelled similarly to this string of characters, or that they match this wildcard pattern. A pattern can include any combination of alphanumeric characters, spaces, and two reserved characters that represent placeholders — * (which matches any number of characters) and ? (which matches exactly one character).
rel_[code]	Related word constraints: require that the results, when paired with the word in this parameter, are in a predefined lexical relation indicated by [code]. Any number of these parameters may be specified any number of times. An assortment of semantic, phonetic, and corpus-statistics-based relations are available. At this time, these relations are available for English-language vocabularies only.


-jja	Popular nouns modified by the given adjective, per Google Books Ngrams	gradual → increase
-jjb	Popular adjectives used to modify the given noun, per Google Books Ngrams	beach → sandy
-syn	Synonyms (words contained within the same WordNet synset)	ocean → sea
-trg	"Triggers" (words that are statistically associated with the query word in the same piece 
of text.)	cow → milking
-ant	Antonyms (per WordNet)	late → early
-spc	"Kind of" (direct hypernyms, per WordNet)	gondola → boat
-gen	"More general than" (direct hyponyms, per WordNet)	boat → gondola
-com	"Comprises" (direct holonyms, per WordNet)	car → accelerator
-par	"Part of" (direct meronyms, per WordNet)	trunk → tree
-bga	Frequent followers (w′ such that P(w′|w) ≥ 0.001, per Google Books Ngrams)	wreak → havoc
-bgb	Frequent predecessors (w′ such that P(w|w′) ≥ 0.001, per Google Books Ngrams)	havoc → 
wreak
-rhy	Rhymes ("perfect" rhymes, per RhymeZone)	spade → aid
-nry	Approximate rhymes (per RhymeZone)	forest → chorus
-hom	Homophones (sound-alike words)	course → coarse
-cns	Consonant match	sample → simple




]

answer = prompt.select("Which letter?", numbers, per_page: 4, cycle: true)

puts answer.inspect
