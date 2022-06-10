FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["ExerciseProgrammer.csproj", "."]
RUN dotnet restore "ExerciseProgrammer.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "ExerciseProgrammer.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ExerciseProgrammer.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish app/publish .
ENTRYPOINT dotnet ExerciseProgrammer.dll


# FROM mcr.microsoft.com/dotnet/runtime:5.0 AS base
# WORKDIR /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
# WORKDIR /src
# COPY ["DiscordBot.csproj", "./"]
# RUN dotnet restore "DiscordBot.csproj"
# COPY . .
# WORKDIR "/src/."
# RUN dotnet build "DiscordBot.csproj" -c Release -o /app/build

# FROM build AS publish
# RUN dotnet publish "DiscordBot.csproj" -c Release -o /app/publish

# FROM base AS final
# WORKDIR /app
# COPY --from=publish /app/publish .
# ENTRYPOINT ["dotnet", "DiscordBot.dll"]