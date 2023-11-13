From: Andreas Schwab <schwab@suse.de>
Date: Mon, 13 Nov 2023 09:45:58 +0100
Subject: [6.6 regression] qemu-system-riscv64: Unable to read ISA_EXT
 KVM register ssaia, error -1
In-Reply-To: <mhng-b2b81553-0e94-4f02-abe4-d5eb30a05613@palmer-ri-x1c9a>
	(Palmer Dabbelt's message of "Thu, 09 Nov 2023 07:45:21 -0800 (PST)")
References: <mhng-b2b81553-0e94-4f02-abe4-d5eb30a05613@palmer-ri-x1c9a>
Message-ID: <mvmbkby3ut5.fsf@suse.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 09 2023, Palmer Dabbelt wrote:

> On Thu, 09 Nov 2023 01:19:20 PST (-0800), schwab at suse.de wrote:
>> v6.6 broke KVM with qemu 8.1.2.
>
> Do you have known good commits for those?

It's a regression from 6.5, probably 2a88f38cd58d.

> What's the host, just QEMU of the same version?

Yes, both the same.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

