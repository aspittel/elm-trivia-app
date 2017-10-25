module Questions exposing (..)

type alias Question =
    { question : String
    , answers : List String
    , correctAnswer : String
    }
    
ladyGagaQuestion : Question
ladyGagaQuestion = 
    { question = "Which singer's real name is Stefani Joanne Angelina Germanotta?"
    , answers = ["Pink", "Lady Gaga", "Rihanna", "Ariana Grande"]
    , correctAnswer = "Lady Gaga"
    }

planetQuestion : Question
planetQuestion = 
    { question = "Which of the planets is closest to the sun?"
    , answers = ["Earth", "Jupiter", "Mercury", "Mars"]
    , correctAnswer = "Mercury"
    }

greekQuestion : Question
greekQuestion = 
    { question = "According to Greek mythology who was the first woman on earth?"
    , answers = ["Aphrodite", "Artemis", "Athena", "Pandora"]
    , correctAnswer = "Pandora"
    }

femalePMQuestion : Question
femalePMQuestion = 
    { question = "In 1960, which country became the first in the world to have a female Prime Minister?"
    , answers = ["Sri Lanka", "England", "United States", "Brazil"]
    , correctAnswer = "Sri Lanka"
    }


question : List Question
question = [ ladyGagaQuestion
           , planetQuestion
           , greekQuestion
           , femalePMQuestion
           ]