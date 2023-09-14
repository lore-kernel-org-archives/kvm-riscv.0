From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 14 Sep 2023 10:52:15 +0100
Subject: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <20230914-ee133dd5e804282ce28833d6@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-ee133dd5e804282ce28833d6@orel>
Message-ID: <20230914-reflector-preshow-786425ad7ae2@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023 at 11:36:01AM +0200, Andrew Jones wrote:
> > +static inline void cpu_relax(void)
> > +{
> > +#ifdef __riscv_zihintpause
> > +	asm volatile("pause" ::: "memory");
> > +#else
> > +	/* Encoding of the pause instruction */
> > +	asm volatile(".4byte 0x100000F" ::: "memory");
> > +#endif
> > +}
> 
> cpu_relax() should go to include/riscv/processor.h

Can the one from asm/vdso/processor.h be reused, or are there special
considerations preventing that?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230914/57d60a48/attachment.sig>
