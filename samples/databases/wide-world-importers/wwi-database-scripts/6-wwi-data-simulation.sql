-- Run data simulation to populate the database.
-- Runtime: ~30 minutes

USE WideWorldImporters;
GO

SET NOCOUNT ON;

EXEC WideWorldImporters.DataLoadSimulation.Configuration_ApplyDataLoadSimulationProcedures;
EXEC WideWorldImporters.DataLoadSimulation.DailyProcessToCreateHistory 
    @StartDate = '20130101',
    @EndDate = '20160430',
    @AverageNumberOfCustomerOrdersPerDay = 60,
    @SaturdayPercentageOfNormalWorkDay = 50,
    @SundayPercentageOfNormalWorkDay = 0,
    @UpdateCustomFields = 1,
    @IsSilentMode = 1,
    @AreDatesPrinted = 1;
EXEC WideWorldImporters.DataLoadSimulation.Configuration_RemoveDataLoadSimulationProcedures;
