From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 24 Apr 2024 09:23:15 +0200
Subject: [RFC PATCH 0/7] riscv: Add support for Ssdbltrp extension
In-Reply-To: <20240423-fresh-constrict-c28f949665e8@spud>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240423-fresh-constrict-c28f949665e8@spud>
Message-ID: <380532d7-41bf-4fcc-bcff-3cb6de0b172f@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 23/04/2024 18:24, Conor Dooley wrote:
> On Thu, Apr 18, 2024 at 04:26:39PM +0200, Cl?ment L?ger wrote:
> 
>>  drivers/firmware/Kconfig                      |   7 +
>>  drivers/firmware/Makefile                     |   1 +
>>  drivers/firmware/riscv_dbltrp.c               |  95 ++++++++++
> 
> From what we discussed with Arnd back when we started routing the dts
> and soc driver stuff via the soc tree, riscv stuff in drivers/firmware
> supposedly also falls under my remit, and gets merged via the soc tree,
> although I would expect that this and the initial SSE support series
> would go via the riscv tree since they touch a lot more than just
> drivers/firmware.

Yes indeed.

> 
> Could you create a drivers/firmware/riscv directory for this dbltrp file
> and whichever of this or the SSE patch that lands first add a maintainers
> entry for drivers/firmware/riscv that links to my git tree?

Yes sure, I'll modify this one as well as the SSE series.

> It probably also makes sense to create per-driver entries for each of
> the dbltrp and sse drivers that ensures you get CCed on any patches
> for them.
> 

Indeed, missed that.

Thanks,

Cl?ment

