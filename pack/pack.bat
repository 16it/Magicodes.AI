:: �������ַ���
echo %1
:: ��Ŀ������ַ
echo %2

:: ɾ����ʷ��
del %1 /f /q /a 

:: ������
set nupkg=""

:: ����
dotnet msbuild %2 /p:Configuration=Release

:: ���
dotnet pack %2 -c Release --output ../../pack/nupkgs

:: ���°�����
for %%a in (dir /s /a /b "./nupkgs/%1") do (set nupkg=%%a)

:: ���Ͱ�
nuget push nupkgs/%nupkg% oy2chgzro4fvjszwy7zqsbmnunjbd6termwob5o6ddqmlm -Source https://www.nuget.org/api/v2/package