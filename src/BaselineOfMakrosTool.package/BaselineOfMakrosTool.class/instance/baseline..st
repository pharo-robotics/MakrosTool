baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'Makros' with: [ spec repository: 'github://sbragagnolo/Makros:master' ].
			spec package: #MakrosTool ]