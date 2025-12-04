# Cria diretório raiz
$projectRoot = "project"
New-Item -ItemType Directory -Path $projectRoot -Force | Out-Null

# Estrutura de diretórios
$folders = @(
    "$projectRoot/src",
    "$projectRoot/src/domain",
    "$projectRoot/src/domain/entities",
    "$projectRoot/src/domain/repositories",
    "$projectRoot/src/use_cases",
    "$projectRoot/src/interfaces",
    "$projectRoot/src/infrastructure",
    "$projectRoot/src/infrastructure/db",
    "$projectRoot/src/infrastructure/db/models",
    "$projectRoot/src/infrastructure/db/repositories",
    "$projectRoot/src/infrastructure/external_services",
    "$projectRoot/src/config",
    "$projectRoot/src/shared",
    "$projectRoot/src/shared/exceptions",
    "$projectRoot/src/shared/helpers",
    "$projectRoot/src/shared/middlewares",
    "$projectRoot/src/shared/utils",
    "$projectRoot/src/shared/validators",
    "$projectRoot/tests",
    "$projectRoot/tests/unit",
    "$projectRoot/tests/unit/domain",
    "$projectRoot/tests/unit/use_cases",
    "$projectRoot/tests/integration",
    "$projectRoot/tests/integration/api"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force | Out-Null
}

# Arquivos vazios que serão criados
$files = @(
    "$projectRoot/src/__init__.py",
    "$projectRoot/src/config/settings.py",
    "$projectRoot/main.py",
    "$projectRoot/requirements.txt",
    "$projectRoot/.env",
    "$projectRoot/.dockerignore",
    "$projectRoot/Dockerfile",
    "$projectRoot/README.md"
)

foreach ($file in $files) {
    if (!(Test-Path $file)) {
        New-Item -ItemType File -Path $file | Out-Null
    }
}
