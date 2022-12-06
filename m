From: Jisheng Zhang <jszhang@kernel.org>
Date: Tue, 6 Dec 2022 23:02:35 +0800
Subject: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <12207576.O9o76ZdvQC@diego>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <10190559.nUPlyArG6x@diego>
 <Y45LRu0Gvrurm5Rh@spud>
 <12207576.O9o76ZdvQC@diego>
Message-ID: <Y49Zi2CNv8pZSAe5@xhacker>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 06, 2022 at 01:39:50AM +0100, Heiko St?bner wrote:
> Am Montag, 5. Dezember 2022, 20:49:26 CET schrieb Conor Dooley:
> > On Mon, Dec 05, 2022 at 07:49:01PM +0100, Heiko St?bner wrote:
> > > Am Montag, 5. Dezember 2022, 19:36:45 CET schrieb Conor Dooley:
> > > > Heiko, Jisheng,
> > > > On Mon, Dec 05, 2022 at 11:40:44PM +0800, Jisheng Zhang wrote:
> > > > > Yesterday, I also wanted to unify the two instruction fix into
> > > > > one. But that would need to roll back the
> > > > > riscv_alternative_fix_auipc_jalr() to your v1 version. And IMHO,
> > > > > it's better if you can split the Zbb string optimizations series
> > > > > into two: one for alternative improvements, another for Zbb. Then
> > > > > we may get the alternative improvements and this inst extension
> > > > > series merged in v6.2-rc1.
> > > > 
> > > > Heiko, perhaps you can correct me here:
> > > > 
> > > > Last Wednesday you & Palmer agreed that it was too late in the cycle to
> > > > apply any of the stuff touching alternatives?
> > > > If I do recall correctly, gives plenty of time to sort out any
> > > > interdependent changes here.
> > > > 
> > > > Could easily be misremembering, wouldn't be the first time!
> > > 
> > > You slightly misremembered, but are still correct with the above ;-) .
> > > 
> > > I.e. what we talked about was stuff for fixes for 6.1-rc, were Palmers
> > > wisely wanted to limit additions to really easy fixes for the remaining
> > > last rc, to not upset any existing boards.
> > 
> > Ahh right. I was 50-50 on whether something like that was said so at
> > least I am not going crazy.
> > 
> > > But you are still correct that we also shouldn't target the 6.2 merge window
> > > anymore :-) .
> > > 
> > > We're after -rc8 now (which is in itself uncommon) and in his -rc7
> > > announcement [0], Linus stated
> > > 
> > > "[...] the usual rule is that things that I get sent for the
> > > merge window should have been all ready _before_ the merge window
> > > opened. But with the merge window happening largely during the holiday
> > > season, I'll just be enforcing that pretty strictly."
> > 
> > Yah, of all the windows to land patchsets that are being re-spun a few
> > days before it opens this probably isn't the best one to pick!
> > 
> > > That means new stuff should be reviewed and in linux-next _way before_ the
> > > merge window opens next weekend. Taking into account that people need
> > > to review stuff (and maybe the series needing another round), I really don't
> > > see this happening this week and everything else will get us shouted at
> > > from atop a christmas tree ;-) .
> > > 
> > > That's the reason most maintainer-trees stop accepting stuff after -rc7

Thanks for the information, then we have more time to test and review
this series.

> > 
> > Aye, in RISC-V land maybe we will get there one day :)
> > 
> > For the original question though, breaking them up into 3 or 4 smaller
> > bits that could get applied on their own is probably a good idea?
> > 
> > Between yourselves, Drew and Prabhakar there's a couple series touching
> > the same bits. Certainly don't want to seem like I am speaking for the

Because alternative is the best solution to riscv extensions while still
keep one unified kernel Image ;)

> > Higher Powers here, but some sort of logical ordering would probably be
> > a good idea so as not to hold each other up?
> > The non-string bit of your series has been fairly well reviewed & would,
> > in theory, be mergeable once the tree re-opens? Timing aside, Jisheng's
> > idea seems like a good one, no?

IMHO, it will be better if Palmer can merge Heiko's alternative improvements
into riscv-next once well reviewed and the window is reopen. Then Drew,
Prabhakar and I can rebase on that tree.

> 
> yeah, I had that same thought over the weekend - with the generic
> part being pretty good in the review and only the string part needing
> more work and thus ideally splitting the series [0] .
> 
> Jisheng's series just made that even more important to do :-)
> 
> 
> Heiko
> 
> 

