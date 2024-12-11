interface DialogTree {
    name: string
    npc_name: string
    lines: NPC_LINE[]
    initial_line: @NPC_LINE
}

interface NPC_LINE {
    id: string
    text: string
    choices?: Choice[]
}

interface Choice {
    text: string
    next_line: @NPC_LINE
}