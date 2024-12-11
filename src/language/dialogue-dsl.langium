grammar DialogueDsl

import './dialogue-dsl-abstractsyntax'

entry DialogRule:
    '@DIALOGUE' name=STRING ';'
    '@NPC' npc_name=STRING ';'
    '@LINES' '{' lines+=NpcLineRule+ '}' ';'
    '@CHOICES' '{' choiceDefinitions+=ChoiceDefinition+ '}' ';'
    '@INITIAL_LINE' initial_line=[NpcLineRule] ';'
;

NpcLineRule:
    id=ID ':' text=STRING ';'
;

ChoiceDefinition:
    from_line=[NpcLineRule] ':' '{' choices+=ChoiceRule+ '}' ';'
;

ChoiceRule:
    text=STRING '->' next_line=[NpcLineRule]
;


hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal INT returns number: /[0-9]+/;
terminal STRING: /"(\\.|[^"\\])*"|'(\\.|[^'\\])*'/;

hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
