-- OX Inventory Items
    ['stolen_phone'] = {
		label = 'Çalıntı Telefon',
		weight = 200,
		stack = false,
		close = true,
		description = 'Bu telefon çalıntı, dikkatli ol!',
		client = {
            image = "stolenphone.png",
        }
	},

	['reset_phone'] = {
		label = 'Sıfırlanmış Kaçak Telefon',
		weight = 200,
		stack = false,
		close = true,
		description = 'Bu telefon sıfırlandı, IMEI kaydı yapılabilir.',
		client = {
            image = "stolenphone.png",
        }
	},

	['registered_phone'] = {
		label = 'İkinci El Kaçak Telefon',
		weight = 200,
		stack = false,
		close = true,
		description = 'Bu telefon IMEI kaydı yapılmış, kullanıma hazır.',
		client = {
            image = "stolenphone.png",
        }
	},


--QB Inventory Items

    stolen_phone = { name = 'stolen_phone', label = 'Çalıntı Telefon', weight = 200, type = 'item', image = 'stolenphone.png', unique = false, useable = false, shouldClose = false, combinable = false, description = 'Bu telefon çalıntı, dikkatli ol!' },
    reset_phone = { name = 'reset_phone', label = 'Sıfırlanmış Kaçak Telefon', weight = 200, type = 'item', image = 'stolenphone.png', unique = false, useable = false, shouldClose = false, combinable = false, description = 'Bu telefon sıfırlandı, IMEI kaydı yapılabilir.' },
    registered_phone = { name = 'registered_phone', label = 'İkinci El Kaçak Telefon', weight = 200, type = 'item', image = 'stolenphone.png', unique = false, useable = false, shouldClose = false, combinable = false, description = 'Bu telefon IMEI kaydı yapılmış, kullanıma hazır.' }