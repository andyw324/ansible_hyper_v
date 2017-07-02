Param(
    [Parameter(Mandatory=$True)][string]$Path,
    [Parameter(Mandatory=$True)][ValidateLength(1,1)][ValidatePattern("[A-Z]")][string]$DriveLetter
)

New-VHD -Path $Path -Dynamic -SizeBytes 5GB

Mount-VHD -Path $Path -Passthru | Initialize-Disk -PartitionStyle GPT -PassThru `
                                | New-Partition -UseMaximumSize -DriveLetter $DriveLetter `
                                | Format-Volume -FileSystem NTFS -NewFileSystemLabel SetupFiles -AllocationUnitSize 4KB -Confirm:$False