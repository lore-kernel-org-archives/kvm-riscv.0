From: Conor Dooley <conor@kernel.org>
Date: Mon, 19 Dec 2022 21:32:16 +0000
Subject: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <Y49p82Iac/+iYQ+1@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <10190559.nUPlyArG6x@diego>
 <Y45LRu0Gvrurm5Rh@spud>
 <12207576.O9o76ZdvQC@diego>
 <Y49Zi2CNv8pZSAe5@xhacker>
 <Y49p82Iac/+iYQ+1@spud>
Message-ID: <Y6DYYL1CGuiKMsY2@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 06, 2022 at 04:12:35PM +0000, Conor Dooley wrote:
> On Tue, Dec 06, 2022 at 11:02:35PM +0800, Jisheng Zhang wrote:
> 
> > > > Higher Powers here, but some sort of logical ordering would probably be
> > > > a good idea so as not to hold each other up?
> > > > The non-string bit of your series has been fairly well reviewed & would,
> > > > in theory, be mergeable once the tree re-opens? Timing aside, Jisheng's
> > > > idea seems like a good one, no?
> > 
> > IMHO, it will be better if Palmer can merge Heiko's alternative improvements
> > into riscv-next once well reviewed and the window is reopen. Then Drew,
> > Prabhakar and I can rebase on that tree.
> 
> Unless I missed something, we're saying the same thing in different ways
> :)

Hey Jisheng,
FYI I'm gonna mark this version of the patchset as "Changes Requested"
in patchwork. Palmer's said he'll apply Heiko's patchset that this
depends on once rc1 is out so I am expecting that you'll rebase on top
of that with the various comments fixed.
Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221219/23be95fc/attachment.sig>
