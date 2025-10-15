CREATE OR REFRESH STREAMING LIVE TABLE bitcoin
TBLPROPERTIES ("quality" = "bronze")
AS

-- Faz a leitura dos arquivos RAW usando cloud_files
SELECT * 
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/coinbase/coinbase/bitcoin_spot/',
  'json',
  map(
    -- Parametros do Auto Loader
    'cloudFiles.inferColumnTypes', 'true',
    'cloudFiles.includeExistingFiles', 'false',
    'cloud_files.schemaEvolutionMode','addNewColumns'
  )
)