From: Conor Dooley <conor@kernel.org>
Date: Wed, 21 Sep 2022 22:33:46 +0100
Subject: [PATCH 02/17] riscv: Extending cpufeature.c to detect V-extension
In-Reply-To: <YytwBzdgCSWSPRNB@spud>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
 <20220921194629.1480202-3-stillson@rivosinc.com>
 <YytwBzdgCSWSPRNB@spud>
Message-ID: <YyuDOr5dMospSNzF@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 21, 2022 at 09:11:56PM +0100, Conor Dooley wrote:
> On Wed, Sep 21, 2022 at 12:46:14PM -0700, Chris Stillson wrote:
> 
> Hey Chris,
> 
> Looks like this only partially made it to the list. The cover letter is
> missing as are a bunch of the patches in the middle, see:
> https://lore.kernel.org/linux-riscv/20220921194629.1480202-3-stillson at rivosinc.com/T/#t

nvm, rest of it seems to have finally made it through now.

> Also, when you run format-patch to generate the patches, please add the
> `-v` flag with a number so that the patchset gets the version number
> added to it.
> 
> Ohh, and Palmer's non-rivos email looks wrong?

Rest still applies though & rerolling as v12 would be nice so that the
tools don't get confused about which version is which since you've now
sent a pair of v1s.

Your SoB is still missing from the individual patches too.

Getting there though, this one is at least threaded & the patches are
not whitespace damaged/line wrapped anymore AFAICT.

Thanks,
Conor.

