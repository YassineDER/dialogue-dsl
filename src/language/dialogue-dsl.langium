grammar DialogueDsl
import './dialogue-dsl-abstractsyntax'

entry DialogRule returns DialogTree:
    '@DIALOGUE' name=STRING ';'
    '@NPC' npc_name=STRING ';'
    '@LINES' '{' lines += NpcLineRule+ '}' ';'
    '@CHOICES' '{' choiceDefs+=ChoiceDefinitionRule+ '}' ';'
    '@INITIAL_LINE' initial_line = [NPC_LINE:ID] ';'
;


NpcLineRule returns NPC_LINE:
    name=ID ':' text=STRING ';'
;

ChoiceDefinitionRule returns ChoiceDefinition:
    from_line=[NPC_LINE:ID] ':' '{' choices+=ChoiceRule+ '}' ';'
;

ChoiceRule returns Choice:
    text=STRING '->' next_line=[NPC_LINE:ID] ';'
;


hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal INT returns number: /[0-9]+/;
terminal STRING: /"(\\.|[^"\\])*"|'(\\.|[^'\\])*'/;

hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
