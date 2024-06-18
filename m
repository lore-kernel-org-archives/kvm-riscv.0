From: Conor Dooley <conor@kernel.org>
Date: Tue, 18 Jun 2024 18:34:50 +0100
Subject: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
In-Reply-To: <20240618-e898082d22cbc508c5655f84@orel>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-12-ajones@ventanamicro.com>
 <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
 <20240618-581fb4c20b4fe05d76eafa44@orel>
 <20240618-deftly-operation-de4f8ac260d5@spud>
 <20240618-e898082d22cbc508c5655f84@orel>
Message-ID: <20240618-hurler-aerospace-1e42dc3c7fe9@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 18, 2024 at 07:05:41PM +0200, Andrew Jones wrote:
> On Tue, Jun 18, 2024 at 05:59:22PM GMT, Conor Dooley wrote:
> > On Tue, Jun 18, 2024 at 06:01:04PM +0200, Andrew Jones wrote:
> > > On Tue, Jun 18, 2024 at 03:48:59PM GMT, Cl?ment L?ger wrote:
> > > > On 26/04/2024 12:08, Andrew Jones wrote:

> > > > 
> > > > BTW, the spec also states that "When the TW (Timeout Wait) bit in
> > > > mstatus is set and WRS.NTO is executed in any privilege mode other than
> > > > M mode, and it does not complete within an implementation-specific
> > > > bounded time limit, the WRS.NTO instruction will cause an illegal
> > > > instruction exception." so I guess the process will be killed in this case ?
> > > 
> > > We don't expect mstatus.TW to be set. If it is, then wfi would likely kill
> > > the kernel before wrs.nto gets a chance to, but one or the other will
> > > certainly ensure usermode never gets a chance to try it :-)
> > > 
> > > We have a handful of these assumptions about how M-mode has configured
> > > things prior to Linux starting. It'd be good if we documented them all
> > > somewhere.
> > 
> > Boot.rst :) If you're adding a new assumption, I think it should go
> > there.
> 
> It's an old assumption (wfi has been counting on it since the beginning of
> time). But documenting it, along with anything else similar to it, in
> boot.rst is a good idea. I've added that to my TODO.

Misunderstanding of "new" I think, I meant new to documentation not just
new to the kernel :)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240618/5651e794/attachment.sig>
