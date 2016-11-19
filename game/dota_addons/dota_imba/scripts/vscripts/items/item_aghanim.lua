--[[	Author: d2imba
		Date:	19.11.2016	]]

function AghanimsSynthCast( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier_synth = keys.modifier_synth
	local modifier_stats = keys.modifier_stats
	local sound_cast = keys.sound_cast

	-- If the caster already has the synth buff, do nothing
	if caster:HasModifier(modifier_synth) then
		return nil
	end

	-- Otherwise, apply the synth buff and the stats buff
	caster:AddNewModifier(caster, nil, modifier_synth, {})
	ability:ApplyDataDrivenModifier(caster, caster, modifier_stats, {})

	-- Play sound
	caster:EmitSound(sound_cast)

	-- Spend the item's only charge
	ability:SetCurrentCharges( ability:GetCurrentCharges() - 1 )
	caster:RemoveItem(ability)
end