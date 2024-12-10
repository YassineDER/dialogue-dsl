grammar DialogueDsl

import './dialogue-dsl-abstractsyntax'

entry DialogueRule returns DialogTree:
    '@DIALOGUE' name = ID
    '@NPC' npc_name = STRING
    '@LINES' lines = 


entry LineRule returns NPC_LINE:



hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal INT returns number: /[0-9]+/;
terminal STRING: /"(\\.|[^"\\])*"|'(\\.|[^'\\])*'/;

hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
