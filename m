From: Andreas Schwab <schwab@suse.de>
Date: Mon, 13 Nov 2023 09:30:06 +0100
Subject: [PATCH 1/6] RISC-V: KVM: return ENOENT in *_one_reg() when reg
 is unknown
In-Reply-To: <5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com> (Daniel
	Henrique Barboza's message of "Thu, 9 Nov 2023 16:33:25 -0300")
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
	<20230731120420.91007-2-dbarboza@ventanamicro.com>
	<mvmr0kz469m.fsf@suse.de>
	<5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com>
Message-ID: <mvmfs1a3vjl.fsf@suse.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 09 2023, Daniel Henrique Barboza wrote:

> Which QEMU version are you using?

The very latest release, both host and guest.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

