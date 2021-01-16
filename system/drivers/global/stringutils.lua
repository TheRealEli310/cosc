-- Any function defining line that starts with "local" is not available globally.

function string.split(s, delimiter)
	local parts, index = {}, 1
	for part in s:gmatch(delimiter) do
		parts[index] = part
		index = index + 1
	end

	return parts
end

function string.limit(s, limit, mode)
	noDots = true
	local length = string.len(s)
	
	if length <= limit then
		return s
	elseif mode == "left" then
		if noDots then
			return string.sub(s, length - limit + 1, -1)
		else
			return "?" .. string.sub(s, length - limit + 2, -1)
		end
	elseif mode == "center" then
		local integer, fractional = math.modf(limit / 2)
		if fractional == 0 then
			return string.sub(s, 1, integer) .. "?" .. string.sub(s, -integer + 1, -1)
		else
			return string.sub(s, 1, integer) .. "?" .. string.sub(s, -integer, -1)
		end
	else
		if noDots then
			return string.sub(s, 1, limit)
		else
			return string.sub(s, 1, limit - 1) .. "?"
		end
	end
end

function string.wrap(data, limit)
	if type(data) == "string" then
		data = { data }
	end

	local wrappedLines, result, preResult, position = {}

	for i = 1, #data do
		wrappedLines[i] = data[i]
	end
 
	local i = 1
	while i <= #wrappedLines do
		local position = wrappedLines[i]:find("\n")
		if position then
			table.insert(wrappedLines, i + 1, string.sub(wrappedLines[i], position + 1, -1))
			wrappedLines[i] = string.sub(wrappedLines[i], 1, position - 1)
		end

		i = i + 1
	end

	local i = 1
	while i <= #wrappedLines do
		result = ""

		for word in wrappedLines[i]:gmatch("[^%s]+") do
			preResult = result .. word

			if string.len(preResult) > limit then
				if string.len(word) > limit then
					table.insert(wrappedLines, i + 1, string.sub(wrappedLines[i], limit + 1, -1))
					result = string.sub(wrappedLines[i], 1, limit)
				else
					table.insert(wrappedLines, i + 1, string.sub(wrappedLines[i], string.len(result) + 1, -1))	
				end

				break	
			else
				result = preResult .. " "
			end
		end

        wrappedLines[i] = result:gsub("%s+$", "")
        wrappedLines[i] = wrappedLines[i]:gsub("^%s+", "")

		i = i + 1
	end

	return wrappedLines
end
