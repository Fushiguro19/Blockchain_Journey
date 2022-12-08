//The function playerHandScore that takes in a string of face cards (Jack, Queen, and King only) and returns the total score of the players hand.

// The cards are represented by the first letter in the name of the card:

// A "K" is 4 points
// A "Q" is 3 points
// A "J" is 2 points


function playerHandScore(hand) {
    let card_score = {"K" : 4, "Q" : 3, "J" : 2};
    let total_score = 0;
    for(let i = 0; i < hand.length; i++){
        if(hand[i] in card_score){
            total_score += card_score[hand[i]];
        }
    }
    return total_score;

}
