# Measure-Time.ps1

if ($args.Count -eq 0) {
    Write-Host "Usage: .\Measure-Time.ps1 <command>"
    exit 1
}

# 获取第一个参数作为命令
$command = $args[0]

# 获取剩余的参数作为命令的参数
$argsList = $args[1..$args.Length]

# 测量执行时间
$executionTime = Measure-Command {
    # 使用Start-Process执行命令，并等待命令完成
    Start-Process -FilePath $command -ArgumentList $argsList -NoNewWindow -Wait
}

# 打印执行时间
"Command '$command $($argsList -join ' ')' executed in $($executionTime.TotalSeconds) seconds."

# 打印执行时间
Write-Host "Execution Time:"
Write-Host ("Days: " + $executionTime.Days)
Write-Host ("Hours: " + $executionTime.Hours)
Write-Host ("Minutes: " + $executionTime.Minutes)
Write-Host ("Seconds: " + $executionTime.Seconds)
Write-Host ("Milliseconds: " + $executionTime.Milliseconds)
Write-Host ("Total Seconds: " + $executionTime.TotalSeconds)
