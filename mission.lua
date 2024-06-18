-- SimRail - The Railway Simulator
-- LUA Scripting scenario
-- Version: 1.0

require("SimRailCore")

DeveloperMode = function()
    return true
end

StartPosition = {54493.15, 251.72, 68411.42, 2.43, 195.00, 0.00}
Sounds = {}
AiTrains = {}

--Below are functions called by SimRail
--- Function called by SimRail when the loading of scenario starts - generally designed for setting up necessery data and preloading-assets
function PrepareScenario()
    SetWeather(WeatherConditionCode.OvercastClouds, 13, 889, 84, 10000, 50.15384, 12.05812, 10, false)
    --CameraSetEulerRotation(Vector3Create(2.43, 195.00, 0.00))
end


function Dev()
    SetWeather(WeatherConditionCode.DrizzleRain, 13, 889, 84, 10000, 50.15384, 12.05812, 10, false)
end

--- Function called by SimRail when the loading finishes - you should set scenario time in here, spawn trains etc. After calling this mission recorder is started and stuff gets registered
function StartScenario()
    StaticTrains = {}
    DisplayChatText("Start")
    DisplayMessage("Start", 15)
    StartRecorder()
    --WP_P
    --Zw_G1
    --Zw_D
    --LC_S1
    PlayerTrainset = SpawnTrainsetOnSignal(nil, FindSignal("LC_S1"), 65, true, true, false, false, {
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_134, false),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Adnu_5051_1900_189_7, false),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.Adnu_5051_1908_095_8_, false),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, true),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
        CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, true)
    })
    SetCameraView(CameraView.Sitting)
    PlayerTrainset.SetState(DynamicState.dsStop, TrainsetState.tsTrain, true)
    PlayerTrainset.SetTimetable(LoadTimetableFromFile("User/tlk.xml"), true)
    PlayerTrainset.SetRadioChannel(1, true)

    WP_Start()
end

function OnPlayerRadioCall()
    VDSetRoute("LC_S1", "LC_W1kps", VDOrderType.TrainRoute)
end

--- Function below is called by SimRail when VD is ready to start receiving orders
function OnVirtualDispatcherReady()
    Log("AI Dispatcher meldet sich zum Dienst!")
    Psary()
    Gora()
    Zawiercie()
    Lazy()
    LacyLc ()
    DGZ()
    DG()
    Bedzin()
    SG()
    KZ()
    Kato()
end

function WP_Start()
    SpawnTrainsetOnSignalAsync("WP_EIE", FindSignal("WP_N"), 60, false, false, true, {
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.ED250_018, false),
    }, function (trainset)
        AiTrains[1] = trainset
        trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
        trainset.SetTimetable(LoadTimetableFromFile("AI/AI_WP_EIE_Ri_Kato.xml"), true)
    end)
    SpawnTrainsetOnSignalAsync("WP_Cargo", FindSignal("WP_B"), 1000, false, false, true, {
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET22_1163, false),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635512_5, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635512_5, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
    }, function (trainset)
        AiTrains[1001] = trainset
        trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
    end)

    CreateCoroutine(function ()
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 19, 31, 00))
        VDSetRoute("WP_B", "WP_M", VDOrderType.TrainRoute)-- WP_Cargo
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 19, 31, 25))
        VDSetRoute("WP_N", "WP_Tkps", VDOrderType.TrainRoute)--EIE
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 19, 33, 00))
        SpawnTrainsetOnSignalAsync("WP_EIE2", FindSignal("Kn_F"), 2500, false, false, true, {
            CreateNewSpawnVehicleDescriptor(LocomotiveNames.ED250_018, false),
        }, function (trainset)
            AiTrains[2] = trainset
            trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
        end)
        VDSetRoute("Kn_F", "Kn_Bkps", VDOrderType.TrainRoute)--EIE2
        VDSetRoute("WP_U", "WP_H", VDOrderType.TrainRoute)--EIE2
        VDSetRoute("WP_H", "WP_Akps", VDOrderType.TrainRoute)--EIE2
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 19, 34, 30))
        VDSetRoute("WP_P", "WP_Tkps", VDOrderType.TrainRoute)--Spieler TLK
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 19, 36, 00))
        VDSetRoute("Kn_C", "Kn_Ekps", VDOrderType.TrainRoute)--EIE
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 19, 37, 00))
        DespawnTrainset(AiTrains[1])
        DespawnTrainset(AiTrains[2])
        VDSetRoute("Kn_C", "Kn_Ekps", VDOrderType.TrainRoute)--Spieler TLK
        SpawnTrainsetOnSignalAsync("WP_Kibel", FindSignal("Kn_F"), 550, false, false, true, {
            CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1003, false),
            CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1003, false)
        }, function (trainset)
            AiTrains[3] = trainset
            trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            trainset.SetTimetable(LoadTimetableFromFile("AI/AI_Leer.xml"), true)
        end)
        VDSetRoute("Kn_F", "Kn_Bkps", VDOrderType.TrainRoute)--WP_Kibel
    end)
    VDSetRoute("Kn_F", "Kn_Bkps", VDOrderType.TrainRoute)
end

function Psary()
    CreateSignalTrigger(FindSignal("L4_1655"), 200,
    {
        check = function (trainset)
            DespawnTrainset(AiTrains[3]) --WP_Kibel
            VDSetRoute("Ps_B", "Ps_N", VDOrderType.TrainRoute)--Spieler TLK
            VDSetManualSignalLightsState("L4_1674N", SignalLightType.Red1, LuaSignalLightState.AlwaysOn)--Defekte SBL Psary
            VDSetManualSignalLightsState("L4_1674N", SignalLightType.Orange1, LuaSignalLightState.AlwaysOn)--Defekte SBL Psary
            SpawnTrainsetOnSignalAsync("Ps_Cargo1", FindSignal("Ps_H"), 25, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET22_911, false),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer2040, 200, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 60, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 80, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 80, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 80, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 85, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 80, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 80, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 80, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 75, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainer3x20, 80, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false, FreightLoads_412W.RandomContainerAll, 80, BrakeRegime.P)
            }, function (trainset)
                AiTrains[1] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
            SpawnTrainsetOnSignalAsync("Ps_Cargo2", FindSignal("Ps_E"), 50, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_929, false),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P)
            }, function (trainset)
                AiTrains[2] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1673"), 275,
    {
        check = function (trainset)
            VDSetRoute("Ps_G", "Ps_Akps", VDOrderType.TrainRoute)--Ps_IC
            VDSetRoute("Ps_V", "Ps_G", VDOrderType.TrainRoute)--Ps_IC
            VDSetRoute("Ps_N", "Ps_Tkps", VDOrderType.TrainRoute)--Spieler TLK
            DespawnTrainset(AiTrains[1001])
            SpawnTrainsetOnSignalAsync("Ps_IC", FindSignal("Ps_V"), 3000, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EP08_013, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.WRmnouz_6151_8870_191_1, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false)
            }, function (trainset)
                AiTrains[3] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L4_1773"), 6,
    {
        check = function (trainset)
            SetWeather(WeatherConditionCode.DrizzleRain, 13, 889, 84, 10000, 50.15384, 12.05812, 10, false)
            DespawnTrainset(AiTrains[1])
            DespawnTrainset(AiTrains[2])
            DespawnTrainset(AiTrains[3])
        end,
        result = function(trainset)
        end
    })
end

function Gora()
    CreateSignalTrigger(FindSignal("L4_1917"), 15,
    {
        check = function (trainset)
            VDSetRoute("GW_G", "GW_Akps", VDOrderType.TrainRoute)
            SpawnTrainsetOnSignalAsync("GW_TOW", FindSignal("GW_G"), 50, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET22_256, false),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 5, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false, FreightLoads_412W.RandomContainer2040, 155, BrakeRegime.P),
            }, function (trainset)
                AiTrains[1] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L4_2009"), 10,
    {
        check = function (trainset)
            VDSetRoute("GW_B", "GW_N", VDOrderType.TrainRoute)
            VDSetRoute("GW_N", "GW_Tkps", VDOrderType.TrainRoute)
            SpawnTrainsetOnSignalAsync("GW_Lokzug", FindSignal("L4_2182"), 50, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_241, false),
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_005, false),
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_092, false),
            }, function (trainset)
                AiTrains[2] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("GW_N"), 20,
    {
        check = function (trainset)
            VDSetRoute("GW_W", "GW_G", VDOrderType.TrainRoute)
            VDSetRoute("GW_G", "GW_Akps", VDOrderType.TrainRoute)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L4_2141"), 2000,
    {
        check = function (trainset)
            DespawnTrainset(AiTrains[1])
            DespawnTrainset(AiTrains[2])
        end,
        result = function(trainset)
        end
    })
end

function Zawiercie()
    CreateSignalTrigger(FindSignal("L4_2141"), 1500,
    {
        check = function (trainset)
            SpawnTrainsetOnSignalAsync("ZW_Kibel", FindSignal("L1_2651"), 50, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1458, false),
            }, function (trainset)
                AiTrains[1] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                trainset.SetTimetable(LoadTimetableFromFile("AI/AI_Leer.xml"), true)
            end)
            SpawnTrainsetOnSignalAsync("ZW_Lok", FindSignal("Zw_H5"), 45, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_929, false),
            }, function (trainset)
                AiTrains[2] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsShunting, true)
            end)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L4_2199"), 130,
    {
        check = function (trainset)
            VDSetRouteWithVariant("Zw_D", "Zw_G1", VDOrderType.TrainRoute, {
                GetMidPointVariant("z_zw_2", false),
                GetMidPointVariant("z_zw_3", false),
                GetMidPointVariant("z_zw_13", false),
                GetMidPointVariant("z_zw_15", false),
                GetMidPointVariant("z_zw_20", true),
                GetMidPointVariant("z_zw_21", true),
                GetMidPointVariant("z_zw_29", false)
            })
            VDSetRoute("Zw_C", "Zw_G2", VDOrderType.TrainRoute)
            SpawnTrainsetOnSignalAsync("ZW_Kibel_abstellung", FindSignal("Zw_Tm34"), 141, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1821, false),
            }, function (trainset)
                AiTrains[3] = trainset
                trainset.SetState(DynamicState.dsCold, TrainsetState.tsDeactivation, true)
                trainset.SetTimetable(LoadTimetableFromFile("AI/AI_Leer.xml"), true)
            end)
            VDSetRouteWithVariant("Zw_E4", "Zw_Akps", VDOrderType.TrainRoute, {
                GetMidPointVariant("z_zw_14", false),
                GetMidPointVariant("z_zw_4", false)
            })            
            SpawnTrainsetOnSignalAsync("ZW_TLK", FindSignal("Zw_E4"), 141, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EP07_174, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B10nou_5051_2008_607_7, false),
            }, function (trainset)
                AiTrains[4] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
            SpawnTrainsetOnSignalAsync("Zw_Wagen", FindSignal("Zw_O106"), 50, false, false, true, {
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
            }, function (trainset)
                AiTrains[5] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
            SpawnTrainsetOnSignalAsync("Zw_Wagen2", FindSignal("Zw_O108"), 75, false, false, true, {
                CreateNewSpawnVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames._441V_31516635512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames._441V_31516635283_3, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames._441V_31516635512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3944_773_6, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.SGS_3151_3947_512_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false),
            }, function (trainset)
                AiTrains[6] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
            SpawnTrainsetOnSignalAsync("Zw_Wagen3", FindSignal("Zw_Tm22"), 60, false, false, true, {
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false),
                CreateNewSpawnVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false),
            }, function (trainset)
                AiTrains[11] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
            SpawnTrainsetOnSignalAsync("Zw_rangier_ET", FindSignal("Zw_O108"), 15, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET22_911, false),
            }, function (trainset)
                AiTrains[9] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsShunting, true)
            end)
            SpawnTrainsetOnSignalAsync("ZW_Kibel_abstellung", FindSignal("Zw_Tm17"), 15, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN76_006, false),
            }, function (trainset)
                AiTrains[7] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsShunting, true)
            end)
            CreateSignalTrigger(FindSignal("Zw_G1"), 50, 
            {
                check = function (trainset)
                    VDSetRouteWithVariant("Zw_D", "Zw_H3", VDOrderType.TrainRoute, { --ZW_Cargo
                        GetMidPointVariant("z_zw_2", false),
                        GetMidPointVariant("z_zw_3", false),
                        GetMidPointVariant("z_zw_13", false),
                        GetMidPointVariant("z_zw_15", false),
                        GetMidPointVariant("z_zw_20", false)
                    })
                    VDSetRoute("Zw_O108", "Zw_Tm24", VDOrderType.ManeuverRoute)
                    SpawnTrainsetOnSignalAsync("ZW_Cargo", FindSignal("Zw_D"), 100, false, false, true, {
                        CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET22_644, false),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                        CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    }, function (trainset)
                        AiTrains[8] = trainset
                        trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                    end)
                end,
                result = function(trainset)
                end
            })
            CreateSignalTrigger(FindSignal("Zw_G2"), 70, --ZW_Kibel
            {
                check = function (trainset)
                    CreateCoroutine(function ()
                        coroutine.yield(CoroutineYields.WaitForSeconds, 20)
                        VDSetRoute("Zw_G2", "t12102k", VDOrderType.ManeuverRoute)--ZW_Kibel
                    end)
                end,
                result = function(trainset)
                end
            })
            CreateSignalTrigger(FindSignal("Zw_Tm24"), 135, 
            {
                check = function (trainset)
                    VDSetRoute("Zw_Tm24", "Zw_Tm21", VDOrderType.ManeuverRoute)--Rangier ET
                    VDSetRoute("Zw_H3", "Zw_S3", VDOrderType.TrainRoute) --ZW_Cargo
                    VDSetRoute("Zw_S3", "Zw_Wkps", VDOrderType.TrainRoute) --ZW_Cargo
                    VDSetRouteWithVariant("LA_D3", "LA_F107", VDOrderType.TrainRoute, { --ZW_Cargo
                        GetMidPointVariant("z_LA_31", false),
                        GetMidPointVariant("z_LA_52ab", false),
                        GetMidPointVariant("z_LA_52cd", false),
                        GetMidPointVariant("z_LA_59ab", true),
                        GetMidPointVariant("z_LA_59cd", false),
                        GetMidPointVariant("z_LA_60ab", true),
                        GetMidPointVariant("z_LA_60cd", true),
                        GetMidPointVariant("z_LA_61", false)
                    })
                end,
                result = function(trainset)
                end
            })
            CreateSignalTrigger(FindSignal("LA_IISpD3"), 600, 
            {
                check = function (trainset)
                    return true
                end,
                result = function(trainset)
                end
            })
        end,
        result = function(trainset)
        end
    })
    CreateCoroutine(function ()
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 20, 15, 15))
        VDSetRouteWithVariant("Zw_G1", "Zw_Mkps", VDOrderType.TrainRoute, { --Spieler TLK
            GetMidPointVariant("z_Zw_45", false),
            GetMidPointVariant("z_Zw_67", false),
            GetMidPointVariant("z_Zw_68", false),
            GetMidPointVariant("z_Zw_76", false)
        })
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 20, 15, 25))
        VDSetRouteWithVariant("LA_C1", "LA_E1kps", VDOrderType.TrainRoute, { --Spieler TLK
            GetMidPointVariant("z_LA_32", false),
            GetMidPointVariant("z_LA_33", false),
            GetMidPointVariant("z_LA_50", false),
            GetMidPointVariant("z_LA_51", false),
            GetMidPointVariant("z_LA_58", false)
        })
        CreateSignalTrigger(FindSignal("LA_C1"), 2200, 
        {
            check = function (trainset)
                VDSetRouteWithVariant("LA_E2", "LA_C2kps", VDOrderType.TrainRoute, {--ZW_SBahn 
                    GetMidPointVariant("z_LA_49", false),
                    GetMidPointVariant("z_LA_47", false),
                    GetMidPointVariant("z_LA_35", false),
                    GetMidPointVariant("z_LA_34", false),
                    GetMidPointVariant("z_LA_6", false)
                })
                VDSetRoute("Zw_N", "Zw_E2", VDOrderType.TrainRoute)--ZW_SBahn                
                SpawnTrainsetOnSignalAsync("ZW_SBahn", FindSignal("LA_E2"), 500, false, false, true, {
                    CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN76_006, false),
                    CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN76_006, false),
                }, function (trainset)
                    AiTrains[10] = trainset
                    trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                end)

                VDSetRouteWithVariant("Zw_R", "Zw_O114", VDOrderType.TrainRoute, { -- AI Güterzug
                    GetMidPointVariant("z_Zw_114", false),
                    GetMidPointVariant("z_Zw_110", true),
                    GetMidPointVariant("z_Zw_108cd", true),
                    GetMidPointVariant("z_Zw_108ab", true)
                })
                VDSetRouteWithVariant("LA_E124", "LA_Bkps", VDOrderType.TrainRoute, { -- AI Güterzug
                    GetMidPointVariant("z_LA_14", true),
                    GetMidPointVariant("z_LA_13", true),
                    GetMidPointVariant("z_LA_12cd", false),
                    GetMidPointVariant("z_LA_12ab", true),
                    GetMidPointVariant("z_LA_10", false),
                    GetMidPointVariant("z_LA_8", false),
                    GetMidPointVariant("z_LA_7cd", false),
                    GetMidPointVariant("z_LA_7ab", true),
                    GetMidPointVariant("z_LA_5", false),
                    GetMidPointVariant("z_LA_3", false)
                })
                SpawnTrainsetOnSignalAsync("LCZW_Güter", FindSignal("LA_E124"), 20, false, false, true, {
                    CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_929, false),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 150, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                    CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zaes_3351_0079_375_1, false, FreightLoads_412W.RandomContainer2040, 0, BrakeRegime.P),
                }, function (trainset)
                    AiTrains[2000] = trainset
                    trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                end)
                
            end,
            result = function(trainset)
            end
        })
        CreateSignalTrigger(FindSignal("LA_C1"), 60, 
        {
            check = function (trainset)
                return true
            end,
            result = function(trainset)
            end
        })
        CreateSignalTrigger(FindSignal("L1_2781"), 200, 
        {
            check = function (trainset)
                VDSetRoute("LB_G1", "LB_H1", VDOrderType.TrainRoute)
            end,
            result = function(trainset)
            end
        })

    end)
end

function Lazy()
    CreateSignalTrigger(FindSignal("LA_C1"), 70, 
    {
        check = function (trainset)
            DespawnTrainset(AiTrains[1])
            DespawnTrainset(AiTrains[2])
            DespawnTrainset(AiTrains[3])
            DespawnTrainset(AiTrains[4])
            DespawnTrainset(AiTrains[5])
            DespawnTrainset(AiTrains[6])
            DespawnTrainset(AiTrains[7])
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L1_2781"), 720, 
    {
        check = function (trainset)
            DespawnTrainset(AiTrains[9])
            DespawnTrainset(AiTrains[10]) -- Alles von Zw ausser 8
            DespawnTrainset(AiTrains[11])
            VDSetRoute("LB_G1", "LB_H1", VDOrderType.TrainRoute)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("LA_C1"), 25, 
    {
        check = function (trainset)
            VDSetRoute("LB_H1", "LB_P2kps", VDOrderType.TrainRoute)
            VDSetRoute("LC_S2", "LC_W1kps", VDOrderType.TrainRoute)
            VDSetRouteWithVariant("LA_F107", "t11609kps", VDOrderType.TrainRoute, { -- AI Kesselzug
                GetMidPointVariant("z_LA_73", false),
                GetMidPointVariant("z_LA_74ab", true),
                GetMidPointVariant("z_LA_74cd", true),
                GetMidPointVariant("z_LA_75", true),
                GetMidPointVariant("z_LA_82", false)
            })
            VDSetRoute("LB_Q123", "LB_J123", VDOrderType.TrainRoute)
            VDSetRoute("LB_J123", "LB_P3kps", VDOrderType.TrainRoute)
            VDSetRoute("LC_S3", "LC_Ukps", VDOrderType.TrainRoute)
            VDSetRoute("LA_Tm152", "LB_Tm200", VDOrderType.ManeuverRoute)
            VDSetRoute("LB_Tm200", "LB_Tm342", VDOrderType.ManeuverRoute)
            VDSetRoute("LB_Tm342", "LB_Tm401", VDOrderType.ManeuverRoute)
            VDSetRoute("LB_Tm401", "LB_Tm403", VDOrderType.ManeuverRoute)
            VDSetRoute("LB_Tm403", "t13914k", VDOrderType.ManeuverRoute)
            VDSetRoute("LB_R2", "LB_G2kps", VDOrderType.TrainRoute) -- AI Pendo
            VDSetRouteWithVariant("LA_E2", "LA_C2kps", VDOrderType.TrainRoute, { -- Ai Pendo
                GetMidPointVariant("z_LA_49", false),
                GetMidPointVariant("z_LA_47", false),
                GetMidPointVariant("z_LA_35", false),
                GetMidPointVariant("z_LA_34", false),
                GetMidPointVariant("z_LA_6", false)
            })            
            SpawnTrainsetOnSignalAsync("La_Cargo", FindSignal("LA_E4"), 20, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.E186_929, false),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 10, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_177_6, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3356_5300_118_0, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3151_5349_475_9, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.EAOS_3351_5356_394_5, false, nil, 150, BrakeRegime.P)
            }, function (trainset)
                AiTrains[1] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
            SpawnTrainsetOnSignalAsync("La_Cargo2", FindSignal("LA_E110"), 275, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET22_644, false),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
            }, function (trainset)
                AiTrains[2] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
            SpawnTrainsetOnSignalAsync("La_Rangier_Loko", FindSignal("LA_Tm152"), 50, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.ET22_256, false),
            }, function (trainset)
                AiTrains[3] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsShunting, true)
            end)
            SpawnTrainsetOnSignalAsync("LC_Pendo", FindSignal("LB_R2"), 10, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.ED250_018, false),
            }, function (trainset)
                AiTrains[2001] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
        end,
        result = function(trainset)
        end
    })
end

function LacyLc ()
    CreateSignalTrigger(FindSignal("LB_H1"), 80, 
    {
        check = function (trainset)
            SpawnTrainsetOnSignalAsync("LC_Toter_EC", FindSignal("LC_S1"), 770, false, false, true, { -- Toter EC
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EP08_001, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.WRmnouz_6151_8870_191_1, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.A9mnouz_6151_1970_214_5, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.A9mnouz_6151_1970_214_5, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_098_8, false),
            }, function (trainset)
                AiTrains[4] = trainset
                trainset.SetState(DynamicState.dsDecEmergency, TrainsetState.tsMaintenance, true)
            end)
            VDSetRoute("LB_M4", "LB_O", VDOrderType.TrainRoute)
            VDSetRoute("LC_Y", "LC_S4kps", VDOrderType.TrainRoute)
            SpawnTrainsetOnSignalAsync("La_Cargo2", FindSignal("LC_Y"), 75, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EU07_096, false),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
                CreateNewSpawnFullVehicleDescriptor(FreightWagonNames.Zas_8451_7862_699_8, false, nil, 150, BrakeRegime.P),
            }, function (trainset)
                AiTrains[5] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L1_2851"), 1165, 
    {
        check = function (trainset)
            VDSetRoute("LC_W2", "LC_S1kps", VDOrderType.TrainRoute)-- LC EC
            SpawnTrainsetOnSignalAsync("LC_EC", FindSignal("L1_2886D"), 50, false, false, true, { -- LC EC
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EP08_013, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.WRmnouz_6151_8870_191_1, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.A9mnouz_6151_1970_214_5, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.A9mnouz_6151_1970_214_5, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_098_8, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
                CreateNewSpawnVehicleDescriptor(PassengerWagonNames.B11bmnouz_6151_2170_064_0, false),
            }, function (trainset)
                AiTrains[6] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
            end)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L1_2869D"), 100, 
    {
        check = function (trainset)
            DespawnTrainset(AiTrains[1])
            DespawnTrainset(AiTrains[2])
            DespawnTrainset(AiTrains[3])
            DespawnTrainset(AiTrains[4])
            DespawnTrainset(AiTrains[5])
            DespawnTrainset(AiTrains[2001])
            VDRestartStationState("Łazy")

        end,
        result = function(trainset)
        end
    })
end

function DGZ()
    CreateSignalTrigger(FindSignal("L1_2885D"), 350, 
    {
        check = function (trainset)
            SpawnTrainsetOnSignalAsync("DZ_Kibel_Abstellung", FindSignal("DZ_G9"), 20, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_047, false),
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1003, false)
            }, function (trainset)
                AiTrains[2001] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsDeactivation, true)
            end)
            SpawnTrainsetOnSignalAsync("DZ_Kibel_Abstellung", FindSignal("DZ_P"), 75, false, false, true, {
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1316, false),
                CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1219, false)
            }, function (trainset)
                AiTrains[2002] = trainset
                trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
                trainset.SetTimetable(LoadTimetableFromFile("AI/AI_DGZ_Osob_Ri_Kra.xml"), true)
            end)
            VDRestartStationState("Łazy")
            VDSetRoute("DZ_B", "DZ_G11", VDOrderType.TrainRoute)
            VDSetRoute("DZ_G11", "DZ_O", VDOrderType.TrainRoute)
            VDSetRoute("DZ_A", "DZ_F", VDOrderType.TrainRoute)
            VDSetRoute("DZ_F", "DZ_N4", VDOrderType.TrainRoute)
            DespawnTrainset(AiTrains[6])
            
        end,
        result = function(trainset)
        end
    })
    CreateCoroutine(function ()
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 20, 31, 30))
        VDSetRoute("DZ_P", "DZ_U101", VDOrderType.TrainRoute)
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 20, 34, 30))
        VDSetRoute("DZ_O", "DZ_Wkps", VDOrderType.TrainRoute)
        VDSetRoute("DZ_X", "DZ_K", VDOrderType.TrainRoute) -- KI
        VDSetRoute("DZ_K", "DZ_C12", VDOrderType.TrainRoute) -- KI
        VDSetRoute("DZ_C12", "DZ_E2kps", VDOrderType.TrainRoute) -- KI
    end)
end

function DG()
    CreateSignalTrigger(FindSignal("L1_2981"), 480, 
    {
        check = function (trainset)
            VDSetCrossingFault("L1_298.000_B", true)
        end,
        result = function(trainset)
        end
    })
    CreateSignalTrigger(FindSignal("L1_2971"), 80, 
    {
        check = function (trainset)
            VDSetRouteWithVariant("DG_A", "DG_N1", VDOrderType.TrainRoute, {
            })
            VDSetRoute("DG_N1", "DG_O_12kps", VDOrderType.TrainRoute)
        end,
        result = function(trainset)
        end
    })

end

function Bedzin()
    CreateSignalTrigger(FindSignal("L1_3023"), 265, 
    {
        check = function (trainset)
            VDSetRoute("B_B", "B_K1", VDOrderType.TrainRoute) -- Player Bz
            VDSetRoute("B_K1", "B_Rkps", VDOrderType.TrainRoute) -- Player Bz
            VDSetRoute("SG_B", "SG_N1", VDOrderType.TrainRoute) -- Player SG
        end,
        result = function(trainset)
        end
    })
end

function SG()
    CreateCoroutine(function ()
        coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 20, 34, 00))
        VDSetRouteWithVariant("SG_N1", "SG_U1", VDOrderType.TrainRoute, {
            GetMidPointVariant("z_SG_40ab", false),
            GetMidPointVariant("z_SG_40cd", false),
            GetMidPointVariant("z_SG_45", false)
        })
        coroutine.yield(CoroutineYields.WaitForSeconds, 20)
        VDSetRoute("SG_U1", "SG_Xkps", VDOrderType.TrainRoute)
    end)
end

function KZ()
    CreateSignalTrigger(FindSignal("L1_3121"), 445, 
    {
        check = function (trainset)
            return true
        end,
        result = function(trainset)
        end
    })     
end

function Kato()
    SpawnTrainsetOnSignalAsync("DZ_Kibel_Abstellung", FindSignal("DZ_P"), 75, false, false, true, {
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1316, false),
        CreateNewSpawnVehicleDescriptor(LocomotiveNames.EN57_1219, false)
    }, function (trainset)
        AiTrains[2002] = trainset
        trainset.SetState(DynamicState.dsAccFast, TrainsetState.tsTrain, true)
        CreateCoroutine(function ()
            coroutine.yield(CoroutineYields.WaitForIngameDateTime, DateTimeCreate(2024, 05, 31, 20, 29, 00))
            trainset.SetTimetable(LoadTimetableFromFile("AI/AI_DGZ_Osob_Ri_Kra.xml"), true)
        end)
        
    end)
end

