-- GUI Dragging module made by Fxke
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Dragger = {}
Dragger.drag = function(guiobject)
	local frame = guiobject
	local isDragging = false
	local inFrame = false
	local dragOffset
	local UIS = game:GetService("UserInputService")
	local TS = game:GetService("TweenService")

	UIS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and inFrame then
			isDragging = true
			dragOffset = Vector2.new(input.Position.X - frame.AbsolutePosition.X, input.Position.Y - frame.AbsolutePosition.Y)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			isDragging = false
		end
	end)

	frame.MouseEnter:Connect(function()
		inFrame = true
	end)
	frame.MouseLeave:Connect(function()
		inFrame = false
	end)

	UIS.InputChanged:Connect(function(input)
		if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local goal = {Position = UDim2.new(0, input.Position.X - dragOffset.X,0, input.Position.Y - dragOffset.Y)}
			TS:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), goal):Play()
		end
	end)
end
return Dragger
