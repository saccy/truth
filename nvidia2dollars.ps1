# Scientifically compares the value of jimmys current 1080ti to that of a new 4090

class GPU {
    [string]$Name
    [int]$Price
    [int]$ModelNo
    $ValueRatio

    GPU([string]$Name) {
        $this.Name = $Name
        $this.SetModelNo($Name)
    }

    [void]SetModelNo([string]$Name) {
        $this.ModelNo = $Name -replace "[^0-9]" , ''
    }

    [void] GetCardValue(){
        $tempValueRatio = $this.ModelNo / $this.Price
        $this.ValueRatio = [math]::Round($tempValueRatio,2)
    }
}

function Compare-Value {
    if ($JimmyCard.ValueRatio -lt $NewCard.ValueRatio) {
        Write-Output 'The new card represents better value.'
    }
    elseif ($JimmyCard.ValueRatio -gt $NewCard.ValueRatio) {
        Write-Output 'Jimmys current card represents better value.'
    }
    else {
        Write-Output 'Both cards represent the same value.'
    }
}

$JimmyCard = [GPU]::new('gtx1080ti')
$JimmyCard.Price = 1200
$JimmyCard.GetCardValue()

$NewCard = [GPU]::new('rtx4090')
$NewCard.Price = 3500
$NewCard.GetCardValue()

Compare-Value
