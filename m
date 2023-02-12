From: Conor Dooley <conor@kernel.org>
Date: Sun, 12 Feb 2023 18:45:43 -0000
Subject: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <48d2ac96-abdd-23bc-b167-08dc2c1a1dbe@roeck-us.net>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net>
 <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud>
 <Y+kcgcncQO/2DNLo@spud>
 <Y+kqi8bQE+8hLfOF@spud>
 <a059a815-dcb0-c575-b5a4-f9433e268e9b@roeck-us.net>
 <Y+kt04c1iRlzUNLA@spud>
 <48d2ac96-abdd-23bc-b167-08dc2c1a1dbe@roeck-us.net>
Message-ID: <Y+kzy1y3Z3j3Ohs9@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 12, 2023 at 10:38:26AM -0800, Guenter Roeck wrote:
> On 2/12/23 10:20, Conor Dooley wrote:
> > On Sun, Feb 12, 2023 at 10:14:13AM -0800, Guenter Roeck wrote:
> > > On 2/12/23 10:06, Conor Dooley wrote:
> > > > On Sun, Feb 12, 2023 at 05:06:09PM +0000, Conor Dooley wrote:
> > > > > On Sun, Feb 12, 2023 at 04:33:58PM +0000, Conor Dooley wrote:
> > > > > > On Sun, Feb 12, 2023 at 03:59:59PM +0000, Conor Dooley wrote:
> > > > > 
> > > > > So as not to lead anyone up the garden path, let me correct myself:
> > > > > 
> > > > > > Hmm, so this appears to be us attempting to patch in alternatives where
> > > > > > none actually exists - seemingly F & D.
> > > > > 
> > > > > And of course that's not true, riscv_has_extension_likely() now uses
> > > > > alternatives as of:
> > > > > bdda5d554e43 ("riscv: introduce riscv_has_extension_[un]likely()")
> > > > > 
> > > > >   From a quick look, it just happens that the only users are F & D.
> > > > > 
> > > > 
> > > > Samuel pointed out that this is a lockdep splat on irc.
> > > > There's a patch on the list that removes the lockdep annotation
> > > > entirely:
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/20230202114116.3695793-1-changbin.du at huawei.com/
> > > > 
> > > > So ye, no surprises that it was config based!
> > > > 
> > > > Palmer posted a "better" fix for that lockdep warning a while ago:
> > > > https://lore.kernel.org/all/20220322022331.32136-1-palmer at rivosinc.com/
> > > > 
> > > > So we'd have to duplicate/reuse that for cpufeature/errata patching.
> > > > 
> > > > 
> > > 
> > > This does not (only) happen in stop_machine().
> > 
> > Yah, sorry I meant that it's the same lockdep splat as is being
> > addressed there.
> > The first patch deletes the lockdep stuff entirely, so removes the
> > splat. I was thinking that we'd need to take Palmer's (IMO better)
> > patch and do the same thing for patching alternatives, but I figure we
> > can just take the text_mutex itself for alternatives & not have to
> > dance around the lock.
> > 
> > I'll go do that I suppose!
> 
> Thanks a lot for the clarification. That sounds like the backtrace
> can be largely ignored.

Yeah, sorry that I phrased that confusingly in the first place.

> However, I still see that the patch series
> results in boot hangs with the sifive_u qemu emulation, where
> the log ends with "Oops - illegal instruction". Is that problem
> being addressed as well ?

Hmm, if it died on the last commit in this series, then I am not sure.
If you meant with riscv/for-next or linux-next that's fixed by a patch
from Samuel:
https://patchwork.kernel.org/project/linux-riscv/patch/20230212021534.59121-3-samuel at sholland.org/

Cheers,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230212/2cf33ed7/attachment-0001.sig>
