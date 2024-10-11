-- ArtificerPlus v1.0.3
-- Onyx
log.info("Successfully loaded " .. _ENV["!guid"] .. ".")
mods.on_all_mods_loaded(function()
    for _, m in pairs(mods) do
        if type(m) == "table" and m.RoRR_Modding_Toolkit then
            for _, c in ipairs(m.Classes) do
                if m[c] then
                    _G[c] = m[c]
                end
            end
        end
    end
end)

gm.post_script_hook(gm.constants.instance_create_depth, function(self, other, result, args)
    if result.value.object_index == gm.constants.oActorTargetPlayer then
        agro = result.value
        local function myFunc()
            --log.info(test.parent.object_name)
            if agro.parent ~= nil and agro.parent.object_name == "oEngiTurretB" then
                Instance.destroy(agro)
            end
        end
        Alarm.create(myFunc, 240)
    end
end)
