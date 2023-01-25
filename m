From: Conor Dooley <conor@kernel.org>
Date: Wed, 25 Jan 2023 22:16:05 +0000
Subject: [PATCH -next v13 03/19] riscv: Add new csr defines related to
 vector extension
In-Reply-To: <20230125142056.18356-4-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-4-andy.chiu@sifive.com>
Message-ID: <Y9GqJbEduVHWY7aU@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 02:20:40PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Follow the riscv vector spec to add new csr numbers.
> 
> [guoren at linux.alibaba.com: first porting for new vector related csr]
> Acked-by: Guo Ren <guoren@kernel.org>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>

This series has gone on for so long, that the tags barely seem to make
sense any more. I won't pretend that I understand why quite so many
people are required to add a few definitions of the spec! Nor can I be
bothered reading 12 revisions on lore to find out why it was done this
way...
They do seem to align with what is in the latest release, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I also noticed that you missed some tags from the v12 submission.
Eg Heiko's here:
https://lore.kernel.org/linux-riscv/2096011.OBFZWjSADL at diego/

There's also one for patch 1:
https://lore.kernel.org/linux-riscv/5335635.Sb9uPGUboI at diego/

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230125/a996bdc1/attachment-0001.sig>
