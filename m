From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 18 Jun 2024 19:05:41 +0200
Subject: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
In-Reply-To: <20240618-deftly-operation-de4f8ac260d5@spud>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-12-ajones@ventanamicro.com>
 <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
 <20240618-581fb4c20b4fe05d76eafa44@orel>
 <20240618-deftly-operation-de4f8ac260d5@spud>
Message-ID: <20240618-e898082d22cbc508c5655f84@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 18, 2024 at 05:59:22PM GMT, Conor Dooley wrote:
> On Tue, Jun 18, 2024 at 06:01:04PM +0200, Andrew Jones wrote:
> > On Tue, Jun 18, 2024 at 03:48:59PM GMT, Cl?ment L?ger wrote:
> > > 
> > > 
> > > On 26/04/2024 12:08, Andrew Jones wrote:
> > > > Export Zawrs ISA extension through hwprobe.
> > > > 
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
> > > >  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> > > >  arch/riscv/kernel/sys_hwprobe.c       | 1 +
> > > >  3 files changed, 6 insertions(+)
> > > > 
> > > > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > > > index b2bcc9eed9aa..e072ce8285d8 100644
> > > > --- a/Documentation/arch/riscv/hwprobe.rst
> > > > +++ b/Documentation/arch/riscv/hwprobe.rst
> > > > @@ -188,6 +188,10 @@ The following keys are defined:
> > > >         manual starting from commit 95cf1f9 ("Add changes requested by Ved
> > > >         during signoff")
> > > >  
> > > > +  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
> > > > +       ratified in commit 98918c844281 ("Merge pull request #1217 from
> > > > +       riscv/zawrs") of riscv-isa-manual.
> > > > +
> > > >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
> > > >    information about the selected set of processors.
> > > >  
> > > > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > > > index 9f2a8e3ff204..a5fca3878a32 100644
> > > > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > > > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > > > @@ -59,6 +59,7 @@ struct riscv_hwprobe {
> > > >  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
> > > >  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
> > > >  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> > > > +#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)
> > > >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> > > >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> > > >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > > > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > > > index 8cae41a502dd..b86e3531a45a 100644
> > > > --- a/arch/riscv/kernel/sys_hwprobe.c
> > > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > > @@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> > > >  		EXT_KEY(ZTSO);
> > > >  		EXT_KEY(ZACAS);
> > > >  		EXT_KEY(ZICOND);
> > > > +		EXT_KEY(ZAWRS);
> > > >  
> > > >  		if (has_vector()) {
> > > >  			EXT_KEY(ZVBB);
> > > 
> > > AFAIU, when used in userspace, this will actually "stall" the processor
> > > until an interrupt/timeout happens, so the current process will keep
> > > occupying the processor doing nothing (up to the next interrupt/timeout)
> > > right ?
> > 
> > Yes, but of course the OS can always preempt the task as well.
> > 
> > > 
> > > BTW, the spec also states that "When the TW (Timeout Wait) bit in
> > > mstatus is set and WRS.NTO is executed in any privilege mode other than
> > > M mode, and it does not complete within an implementation-specific
> > > bounded time limit, the WRS.NTO instruction will cause an illegal
> > > instruction exception." so I guess the process will be killed in this case ?
> > 
> > We don't expect mstatus.TW to be set. If it is, then wfi would likely kill
> > the kernel before wrs.nto gets a chance to, but one or the other will
> > certainly ensure usermode never gets a chance to try it :-)
> > 
> > We have a handful of these assumptions about how M-mode has configured
> > things prior to Linux starting. It'd be good if we documented them all
> > somewhere.
> 
> Boot.rst :) If you're adding a new assumption, I think it should go
> there.

It's an old assumption (wfi has been counting on it since the beginning of
time). But documenting it, along with anything else similar to it, in
boot.rst is a good idea. I've added that to my TODO.

Thanks,
drew

