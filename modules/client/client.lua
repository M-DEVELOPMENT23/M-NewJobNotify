local notification = true
local displayed = false

function SendNUIMessageWithOptions(type, job, text, isClosing)
    if not displayed then
        local jobConfig = Config.Jobs[job]
        displayed = true
        if Config.Debug then
            print("[M-JobNotificationsV2] [DEBUG] " .. jobConfig.name)
            print("[M-JobNotificationsV2] [DEBUG] " .. jobConfig.image)
            print("[M-JobNotificationsV2] [DEBUG] " .. jobConfig.titlecolor)
            print("[M-JobNotificationsV2] [DEBUG] " .. text)
            print("[M-JobNotificationsV2] [DEBUG] " .. jobConfig.textcolor)
            print("[M-JobNotificationsV2] [DEBUG] " .. jobConfig.icon)
        end
        SendNUIMessage({
            type = type,
            jobname = jobConfig.name,
            image = jobConfig.image,
            titlecolor = jobConfig.titlecolor,
            texto = text,
            textcolor = jobConfig.textcolor,
            icon = jobConfig.icon,
            footertext = Config.FooterText,
            backgroundcolor = Config.Ui.backgroundcolor,
            boxshadow = Config.Ui.boxshadow,
            borderradius = Config.Ui.borderradius,
            opacity = Config.Ui.opacity,
            top = Config.Ui.top,
            left = Config.Ui.left,
            borderradiusimg = Config.Ui.borderradiusimg,
            titlefontsize = Config.Ui.fontsize,
            titlefontweight = Config.Ui.fontweight,
            titlefilter = Config.Ui.filter,
        })

        local mostrado = false

        Citizen.CreateThread(function()
            while not mostrado do
                Citizen.Wait(0)
                if not displayed then
                    if IsControlJustPressed(0, 38) then
                        local coords = jobConfig.coords
                        if Config.Debug then
                            print("[M-JobNotificationsV2] [DEBUG] coordenadas marcadas: " .. coords.x .. " " .. coords.y)
                        end

                        SetNewWaypoint(coords.x, coords.y)

                        mostrado = true
                    end
                end
            end
        end)

        Wait(2500)

        displayed = false
    end
end

function ManageBusinessState(job, text, isClosing)
    SendNUIMessageWithOptions('abrirnegocio', job, text, isClosing)
end

function OpenBusiness(job)
    ManageBusinessState(job, Config.Jobs[job].openbusinesstext)
end

function CloseBusiness(job)
    ManageBusinessState(job, Config.Jobs[job].closebusinesstext, true)
end

function CustomTextBusiness(text, job)
    SendNUIMessageWithOptions('customtext', job, text)
end

function ManageNotification(title, text, imageurl, icon, jobcoords, TextFooter)
    if notification then
        local notification = false
        SendNUIMessage({
            type = "notification",
            jobname = title,
            image = imageurl,
            texto = text,
            icon = icon,
            footertext = TextFooter,
        })


        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if not notification and IsControlJustPressed(0, 38) then
                    local coords = jobcoords

                    if Config.Debug then
                        print("[M-JobNotifycatiosnV2] [DEBUG] coordenadas marcadas: " .. coords.x .. " " .. coords.y)
                    end

                    SetNewWaypoint(coords.x, coords.y)

                    if Config.notificationScript == "QBCore" then
                        local QBCore = exports['qb-core']:GetCoreObject()
                        QBCore.Functions.Notify("business marked on gps")
                    elseif Config.notificationScript == "ox" then
                        lib.notify({
                            title = 'GPS',
                            description = "Business marked on gps",
                            type = 'inform'
                        })
                    end

                    return
                end
            end
        end)
    end
    notification = true
end

RegisterNetEvent('m:jobnotifyv2:abrirbusiness')
AddEventHandler('m:jobnotifyv2:abrirbusiness', OpenBusiness)

RegisterNetEvent('m:jobnotifyv2:closebusiness')
AddEventHandler('m:jobnotifyv2:closebusiness', CloseBusiness)

RegisterNetEvent('m:jobnotifyv2:customtextbusiness')
AddEventHandler('m:jobnotifyv2:customtextbusiness', CustomTextBusiness)

RegisterNetEvent('m:jobnotifyv2:opennotification')
AddEventHandler('m:jobnotifyv2:opennotification', ManageNotification)

RegisterNetEvent('m:jobnotifyv2:closenotification')
AddEventHandler('m:jobnotifyv2:closenotification', function()
    SendNUIMessage({
        type = "closenotification",
    })
end)
