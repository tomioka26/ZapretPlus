@echo off
chcp 65001 >nul
:: 65001 - UTF-8
:: NOT RECOMMENDED

cd /d "%~dp0"
call check_updates.bat soft
echo:

set BIN=%~dp0bin\

start "zapret: general" /min "%BIN%winws.exe" --wf-tcp=80,443 --wf-udp=443,50000-50100 ^
--filter-udp=443 --hostlist="list-general.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-50100 --ipset="ipset-discord.txt" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --new ^
--filter-tcp=80 --hostlist="list-general.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-l3=ipv4 --filter-tcp=443 --dpi-desync=syndata --dpi-desync-split-seqovl=652