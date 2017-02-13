/*
 * Copyright (C) 2008-2017 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef FIRELANDS_H_
#define FIRELANDS_H_

#include "Map.h"
#include "CreatureAI.h"

#define DataHeader "FL"
#define FirelandsScriptName "instance_firelands"

uint32 const EncounterCount = 7;

enum FLDataTypes
{
    DATA_BETH_TILAC         = 0,
    DATA_LORD_RHYOLITH      = 1,
    DATA_SHANNOX            = 2,
    DATA_ALYSRAZOR          = 3,
    DATA_BALEROC            = 4,
    DATA_MAJORDOMO_STAGHELM = 5,
    DATA_RAGNAROS           = 6,
};

enum FLCreatureIds
{
    NPC_BLAZING_MONSTROSITY_LEFT    = 53786,
    NPC_BLAZING_MONSTROSITY_RIGHT   = 53791,
    NPC_EGG_PILE                    = 53795,
    NPC_HARBINGER_OF_FLAME          = 53793,
    NPC_MOLTEN_EGG_TRASH            = 53914,
    NPC_SMOULDERING_HATCHLING       = 53794,

    NPC_DULL_PYRESHELL_FOCUS        = 53963,
    NPC_SHANNOX                     = 53691,
    NPC_RAGEFACE                    = 53695, 
    NPC_RIPLIMB                     = 53694,
    NPC_RHYOLITH                    = 52558,
    NPC_BETHTILAC                   = 52498,
    NPC_ALYSRAZOR                   = 52530, 
    NPC_BALEROC                     = 53494,
    NPC_STAGHELM                    = 52571,
    NPC_RAGNAROS                    = 52409,
};

enum FLGameObjectIds
{
    GO_MOLTEN_METEOR = 208966,
};

enum FLSpells
{
    SPELL_TRANSFORM_CHARGED_PYRESHELL_FOCUS = 100497,
    SPELL_CREATE_PYRESHELL_FRAGMENT         = 100519,
    SPELL_SMOLDERING_AURA                   = 101093,
};

enum FLQuestIds
{
    QUEST_HEART_OF_FLAME_ALLIANCE = 29307,
    QUEST_HEART_OF_FLAME_HORDE    = 29308,
};

class DelayedAttackStartEvent : public BasicEvent
{
    public:
        DelayedAttackStartEvent(Creature* owner) : _owner(owner) { }

        bool Execute(uint64 /*e_time*/, uint32 /*p_time*/) override
        {
            _owner->AI()->DoZoneInCombat(_owner, 200.0f);
            return true;
        }

    private:
        Creature* _owner;
};

static void AddSmoulderingAura(Creature* creature)
{
    Map::PlayerList const &PlayerList = creature->GetMap()->GetPlayers();
    if (!PlayerList.isEmpty())
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player* pPlayer = i->GetSource())
                if (pPlayer->GetQuestStatus(QUEST_HEART_OF_FLAME_ALLIANCE) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(QUEST_HEART_OF_FLAME_HORDE) == QUEST_STATUS_INCOMPLETE)
                {
                    creature->CastSpell(creature, SPELL_SMOLDERING_AURA, true);
                    break;
                }
}

template<class AI>
CreatureAI* GetFirelandsAI(Creature* creature)
{
    if (InstanceMap* instance = creature->GetMap()->ToInstanceMap())
        if (instance->GetInstanceScript())
            if (instance->GetScriptId() == sObjectMgr->GetScriptId(FirelandsScriptName))
                return new AI(creature);
    return NULL;
}

#endif // FIRELANDS_H_
