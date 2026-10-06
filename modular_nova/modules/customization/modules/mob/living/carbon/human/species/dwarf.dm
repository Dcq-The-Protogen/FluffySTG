/datum/species/dwarf
	name = "Dwarf"
	id = SPECIES_DWARF
	examine_limb_id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_DWORF,TRAIT_SNOB,
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LITERATE,
		TRAIT_USES_SKINTONES,
	)
	mutantliver = /obj/item/organ/liver/evolved/dworf
	mutanttongue = /obj/item/organ/tongue/dwarven
	skinned_type = /obj/item/stack/sheet/animalhide/carbon/human
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1.0
	body_size_restricted = TRUE
	damage_modifier = 10 /// Small mf with thick miner skin
	coldmod = 0.8 /// Caves can be cold
	heatmod = 0.8 /// Caves can be hot


/datum/species/dwarf/on_species_gain(mob/living/carbon/human/dwarf_holder, datum/species/old_species)
	..()
	dwarf_holder.add_movespeed_modifier(/datum/movespeed_modifier/beingadwarf)

/datum/species/dwarf/on_species_loss(mob/living/carbon/human/dwarf_holder)
	dwarf_holder.remove_movespeed_modifier(/datum/movespeed_modifier/beingadwarf)
	return ..()

/datum/species/dwarf/get_species_description()
	return placeholder_description

/datum/species/dwarf/get_species_lore()
	return list(placeholder_lore)

/datum/species/dwarf/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_facial_haircolor("#a55310", update = FALSE)
	human.set_facial_hairstyle("Beard (Dwarf)")

/obj/item/organ/liver/evolved/dworf
	alcohol_tolerance = 0
/// Dworfs are heavy drinkers, so, ugh, theirs livers are extremely robust to any kind of alcohol. Yeah

/datum/movespeed_modifier/beingadwarf /// short legs, less speed
	multiplicative_slowdown = 0.15
	blacklisted_movetypes = FLOATING|FLYING
