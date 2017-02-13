UPDATE `creature_template` SET `ScriptName` = 'boss_alysrazor' WHERE `entry` = 52530;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_blazing_power' WHERE `entry`=53554;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_incindiary_cloud' WHERE `entry`=53541;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_fiery_vortex' WHERE `entry`=53693;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_fiery_tornado' WHERE `entry`=53698;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_blazing_talon_initiate' WHERE `entry`=53896;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_blazing_talon_clawshaper' WHERE `entry`=53734;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_brushfire' WHERE `entry`=53372;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_blazing_broodmother' WHERE `entry`=53900;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_blazing_broodmother' WHERE `entry`=53680;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_molten_egg' WHERE `entry`=53681;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_voracious_hatchling' WHERE `entry`=53509;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_voracious_hatchling' WHERE `entry`=53898;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_plump_lava_worm' WHERE `entry`=53520;
UPDATE `creature_template` SET `ScriptName`='npc_alysrazor_molten_meteor' WHERE `entry` IN (53489, 53784);

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_alysrazor_fieroblast', 'spell_alysrazor_harsh_winds', 'spell_alysrazor_molten_feather',
'spell_alysrazor_molten_feather_script', 'spell_alysrazor_cataclysm');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(101223, 'spell_alysrazor_fieroblast'),
(101294, 'spell_alysrazor_fieroblast'),
(101295, 'spell_alysrazor_fieroblast'),
(101296, 'spell_alysrazor_fieroblast'),
(100640, 'spell_alysrazor_harsh_winds'),
(97128, 'spell_alysrazor_molten_feather'),
(97734, 'spell_alysrazor_molten_feather_script'),
(102111, 'spell_alysrazor_cataclysm');

UPDATE `creature_template_addon` SET `bytes1`=0, `auras`='100712 99905 99595' WHERE `entry` IN (52530, 54044, 54045, 54046);
UPDATE `creature_template_addon` SET `auras`='98462' WHERE `entry`=53158;
UPDATE `creature_template` SET `Inhabittype`=7 WHERE `entry` IN (53158, 53554, 53541, 53698);
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=53554;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=53541;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=53698;
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 128 WHERE `entry` IN (53693, 53698);
UPDATE `creature_template` SET `npcflag`=1, `unit_flags`=0, `type_flags`=1024 WHERE `entry`=53089;
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0, `flags_extra`=128 WHERE `entry` IN (53554, 53541);
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` IN (53734, 54055, 53896, 54063, 54064, 54065);

DELETE FROM `creature_text` WHERE `entry` = 52530;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`, `BroadcastTextId`, `comment`) VALUES
(52530, 0, 0, 'I serve a new master now, mortals!', 14, 0, 100, 0, 0, 24426, 52319, 'Alysrazor aggro'),
(52530, 1, 0, 'The light... mustn\'t... burn out...', 14, 0, 100, 0, 0, 24429, 0, 'Alysrazor death'),
(52530, 2, 0, 'BURN!', 14, 0, 100, 0, 0, 24430, 52320, 'Alysrazor kill 01'),
(52530, 2, 1, 'For his Glory!', 14, 0, 100, 0, 0, 24431, 52321, 'Alysrazor kill 02'),
(52530, 3, 0, 'These skies are MINE!', 14, 0, 100, 0, 0, 24434, 52322, 'Alysrazor spiral 01'),
(52530, 3, 1, 'I will burn you from the sky', 14, 0, 100, 0, 0, 24435, 52323, 'Alysrazor spiral 02'),
(52530, 4, 0, 'Fire... fire...', 14, 0, 100, 0, 0, 24436, 52324, 'Alysrazor transition 01'),
(52530, 5, 0, 'Reborn in flame!', 14, 0, 100, 0, 0, 24437, 52325, 'Alysrazor transition 02');

