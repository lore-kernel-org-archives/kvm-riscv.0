From: Conor Dooley <conor@kernel.org>
Date: Tue, 23 Apr 2024 17:24:01 +0100
Subject: [RFC PATCH 0/7] riscv: Add support for Ssdbltrp extension
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
Message-ID: <20240423-fresh-constrict-c28f949665e8@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 18, 2024 at 04:26:39PM +0200, Cl?ment L?ger wrote:

>  drivers/firmware/Kconfig                      |   7 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/riscv_dbltrp.c               |  95 ++++++++++

From what we discussed with Arnd back when we started routing the dts
and soc driver stuff via the soc tree, riscv stuff in drivers/firmware
supposedly also falls under my remit, and gets merged via the soc tree,
although I would expect that this and the initial SSE support series
would go via the riscv tree since they touch a lot more than just
drivers/firmware.

Could you create a drivers/firmware/riscv directory for this dbltrp file
and whichever of this or the SSE patch that lands first add a maintainers
entry for drivers/firmware/riscv that links to my git tree?
It probably also makes sense to create per-driver entries for each of
the dbltrp and sse drivers that ensures you get CCed on any patches
for them.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240423/068fbd19/attachment-0001.sig>
