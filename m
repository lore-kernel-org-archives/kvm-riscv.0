From: Conor Dooley <conor@kernel.org>
Date: Wed, 25 Jan 2023 22:18:44 +0000
Subject: [PATCH -next v13 04/19] riscv: Clear vector regfile on bootup
In-Reply-To: <428eb479-5066-f8c6-ad98-4eeac53a5be8@rivosinc.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-5-andy.chiu@sifive.com>
 <Y9Gk/FCFBbWC/Pyi@spud>
 <428eb479-5066-f8c6-ad98-4eeac53a5be8@rivosinc.com>
Message-ID: <Y9GqxMFz+m6K9k5c@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 01:57:28PM -0800, Vineet Gupta wrote:
> 
> On 1/25/23 13:54, Conor Dooley wrote:
> > n Wed, Jan 25, 2023 at 02:20:41PM +0000, Andy Chiu wrote:
> > > clear vector registers on boot if kernel supports V.
> > > 
> > > Signed-off-by: Greentime Hu<greentime.hu@sifive.com>
> > > Signed-off-by: Vineet Gupta<vineetg@rivosinc.com>
> > > [vineetg: broke this out to a seperate patch]
> > > Signed-off-by: Andy Chiu<andy.chiu@sifive.com>
> > But this patch didn't carry over the long list of contributors from it's
> > source? Seems a bit odd, that's all.
> > There was also an Rb from Palmer that got dropped too. Was that
> > intentional?
> > https://lore.kernel.org/linux-riscv/20220921214439.1491510-6-stillson at rivosinc.com/
> 
> In v12 this and 5/19 were in one patch, which I broke off into two for
> clarity. Hence the Rb technically doesn't apply.

Technically correct, the best kind, huh?

Anyways, I just noticed that this patch had a comment from Heiko that
wasn't addressed to maybe the omission is for the better!

https://lore.kernel.org/linux-riscv/2331455.NG923GbCHz at diego/

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230125/bb9750c5/attachment-0001.sig>
